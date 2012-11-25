/**
 * Author: Matthias Kuhn
 * Date: 28.10.12
 */


// Create a function that returns a particular property of its parameter.
// If that property is a function, invoke it (and pass optional params).
function ƒ(name)
{
  var v, params = Array.prototype.slice.call(arguments, 1);
  return function (o)
  {
    return (typeof (v = o[name]) === 'function' ? v.apply(o, params) : v );
  };
};

// Return the first argument passed in
function I(d)
{
  return d
};


// Global Object, where we'll declare all the usefull stuff inside
var qgep = { def: {} };

require( ["dojo/on", "dojo/ready"], function(  on, ready ) {

  qgep.def.ProfilePlot = dojo.declare( null,
  {
    margin: 10,
    reachData: [],
    data: [ {} ],
    terrainData: [ {} ],
    x: d3.scale.linear(),
    y: d3.scale.linear(),
    xAxis: d3.svg.axis()
      .scale(this.x)
      .tickSize(-this.height)
      .tickSubdivide(true),
    yAxis: d3.svg.axis()
      .scale(this.y)
      .ticks(4)
      .orient("right"),
    verticalExaggeration: 5,
    myZoom: d3.behavior.zoom(),
    terrainLine: d3.svg.line(),

    initSVG: function( parent )
    {
      var that = this;

      // Add an SVG element with the desired dimensions and margin.
      this.mainGroup = parent.append("svg:svg")
        .append("svg:g")
        .attr( "transform", "translate(" + this.margin + "," + this.margin + ")" );

      // Add the clip path.
      this.clipPath = this.mainGroup.append("svg:clipPath")
        .attr("id", "profileMask")
        .append("svg:rect");

      // Add the x-axis.
      this.gxAxis = this.mainGroup.append("svg:g")
        .attr("class", "x axis");

      // Add the y-axis.
      this.gyAxis = this.mainGroup.append("svg:g")
        .attr("class", "y axis");

      this.myZoom
        .on( 'zoom', dojo.hitch( this, this.zoom ) );

      this.zoomRect = this.mainGroup.append( "svg:rect" )
        .attr( "class", "pane" )
        .call( this.myZoom );

      this.profileViewPort = this.mainGroup.append( "svg:g")
        .attr( "clip-path", "url(#profileMask)" );

      this.profile = this.profileViewPort.append( "svg:g" )
        .attr( "class", "profile" );

      this.terrainProfile = this.profile.append( 'svg:path' )
        .attr( 'class', 'terrain' );

      this.terrainLine
        .x( function(d) { return that.x( d.offset ); } )
        .y( function(d) { return that.y( d.coverLevel ); } );

      // TODO: make resize more intelligent so it gets proper axis bounds already on first init
      this.onResize();
      this.onResize();

      //  Subscribe to window resize event
      on( window, "resize", dojo.hitch( this, this.onResize ) );
    },

    onResize: function ()
    {
      // Get the size of the axis
      var xAxisHeight = d3.max( d3.select("g.x.axis"), function (d) { return d.pop().getBoundingClientRect().height } )
      var yAxisWidth = d3.max( d3.select("g.y.axis"), function (d) { return d.pop().getBoundingClientRect().width } )

      this.width = d3.select("body").property( 'clientWidth' ) - 2*this.margin - yAxisWidth;
      this.height = d3.select("body").property( 'clientHeight' ) - 2*this.margin - xAxisHeight;

      // Scales and axes. Note the inverted domain for the y-scale: bigger is up!
      this.x.range([0, this.width]);
      this.y.range([this.height, 0]);

      this.mainGroup.select( "g.x.axis" ).attr( "transform", "translate(0," + this.height + ")" );
      this.mainGroup.select( "g.y.axis" ).attr( "transform", "translate(" + this.width + ",0)" );

      this.xAxis.scale(this.x).tickSize(-5).tickPadding(5);
      this.yAxis.scale(this.y);

      this.clipPath
        .attr("width", this.width )
        .attr("height", this.height );

      this.gxAxis
        .attr("transform", "translate(0," + this.height + ")")
        .call( this.xAxis );

      this.gyAxis
        .attr("transform", "translate(" + this.width + ",0)")
        .call( this.yAxis );

      this.zoomRect
        .attr( "width", this.width )
        .attr( "height", this.height );
    },

    // Data changed: domain needs to be adjusted
    scaleDomain: function ()
    {
      this.profile
        .attr("transform", "translate(0,0) scale(1)");

      this.myZoom.scale(1);
      this.myZoom.translate([0,0]);

      // Compute the minimum and maximum offset, and the maximum level.
      this.x.domain([0, d3.max( this.reachData, ƒ('endOffset'))]);
      var maxY = d3.max(this.terrainData, ƒ('coverLevel'));
      minY = maxY - this.x.invert( maxY ) / this.verticalExaggeration;
      this.y.domain([minY, maxY ]);

      this.mainGroup.select("g.x.axis").call(this.xAxis);
      this.mainGroup.select("g.y.axis").call(this.yAxis);

      this.redraw();
    },

    // Animation to change scale
    changeScale: function ()
    {
      var t = this.mainGroup.transition()
        .duration(750);

      t.select(".x.axis").call(this.xAxis);
      t.select(".y.axis").call(this.yAxis);

      this.updateReaches();
    },

    // zoom and pan operations
    zoom: function ()
    {
      this.transform( this.x, d3.event.translate[0], d3.event.scale );
      this.transform( this.y, d3.event.translate[1], d3.event.scale );
/*
      this.profile
        .attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
*/
      this.mainGroup.select("g.x.axis").call(this.xAxis);
      this.mainGroup.select("g.y.axis").call(this.yAxis);

      this.redraw(0);
    },

    // Copied from an old d3js source file
    transform: function (scale, o, k)
    {
      var domain = scale.__domain || (scale.__domain = scale.domain()),
        range = scale.range().map(function(v) { return (v - o) / k; });
      scale.domain(domain).domain(range.map(scale.invert));
    },

    // Data: reaches
    createReaches: function ( data )
    {
      this.reachData = data;

      this.reaches = this.profile.selectAll('.reach')
        .data( data, ƒ( 'gid' ) );

      this.reaches
        .exit()
        .remove();

      var newReaches = this.reaches
        .enter()
        .append('svg:g')
        .attr( 'class', function(d) { return 'usage-current-' + d.usageCurrent; } )
        .classed( 'reach', true )
        .attr( 'id', function(d) { return d.objId; } );

      newReaches
        .append('polygon')
        .call( this.myZoom )
        .on( dojo.hitch( this, this.onClick ), 'click' )
        .append('title')
        .text( function(d) { return d.objId + '\nWidth:' + d.width_m; } );

      newReaches
        .selectAll( '.blind-connection' )
        .data( function(d) { return d.reachPoints; }, function(rp) { return rp.objId; } )
        .enter()
        .append( 'circle' )
        .attr( 'class', 'blind-connection')
        .attr( 'r', 3 )
        .attr( 'fill', 'red' );
    },

    createSpecialStructures: function ( data )
    {
      var that = this;

      this.specialStructures = this.profile
        .selectAll( '.special-structure' )
        .data( data, ƒ( 'gid' ) );

      this.specialStructures.exit()
        .transition()
        .duration(300)
        .attr('opacity',0)
        .remove();

      var newSpecialStructures = this.specialStructures
        .enter()
        .append('svg:g')
        .attr( 'class', 'special-structure' )
        .attr( 'id', function(d) { return d.objId; } );

      newSpecialStructures
        .append('svg:rect');

      newSpecialStructures
        .append('svg:text')
        .attr( 'fill', '#000000')
        .attr( 'stroke', '#ffffff')
        .attr( 'stroke-width', '0.5' )
        .text( function(d) { return d.description; } );
    },

    updateReaches: function( duration )
    {
      // create new reaches
      var that = this;

      var oponPolys = this.reaches.selectAll('polygon');
      var oponBlindConnections = this.reaches.selectAll('.blind-connection');

      if ( duration > 0 )
      {
        oponPolys = oponPolys
          .transition()
          .duration(duration);
      }

      oponPolys
        .attr( 'points', function(d)
        {
          var dy = d.width_m * Math.sqrt(Math.pow(( d.endOffset- d.startOffset ), 2) + Math.pow(( d.startLevel- d.endLevel ), 2)) / ( d.endOffset- d.startOffset )
          var x1, x2, x3, x4;
          var y1, y2, y3, y4;
          x1 = x2 = that.x( d.startOffset );
          x3 = x4 = that.x( d.endOffset );
          y1 = that.y( d.startLevel );
          y2 = that.y( d.startLevel + dy );
          y4 = that.y( d.endLevel );
          y3 = that.y( d.endLevel + dy );

          var pointstr = [
            x1 + ',' + y1,
            x2 + ',' + y2,
            x3 + ',' + y3,
            x4 + ',' + y4
          ].join(' ');

          return pointstr;
        } );

      oponBlindConnections
        .attr( 'cx', function(d) { return that.x(d.offset); } )
        .attr( 'cy', function(d) { return that.y(d.level); } );
    },

    // Data: special structures
    updateSpecialStructures: function ( duration )
    {
      var that = this;

      var oponText = this.specialStructures.selectAll('text');
      var oponRect = this.specialStructures.selectAll('rect');
      if ( duration > 0 )
      {
        oponText = oponText
          .transition()
          .duration(duration);

        oponRect = oponRect
          .transition()
          .duration(duration);
      }

      oponText
        .attr( 'x', function(d) { return that.x( (d.endOffset + d.startOffset)/2 ); })
        .attr( 'y', function(d) { return that.y( d.coverLevel ); });

      oponRect
        .attr('x',      function(d) { return that.x( d.startOffset ); } )
        .attr('y',      function(d) { return that.y( d.coverLevel ); } )
        .attr('width',  function(d) { return that.x( d.endOffset ) - that.x( d.startOffset ); } )
        .attr('height', function(d) { return that.y( d.bottomLevel ) - that.y( d.coverLevel ); } );
    },

    createTerrainPath: function( data )
    {
      this.terrainData = data
        .filter( function(d) { return d.coverLevel != null; } )
        .sort( function(a,b) { return a.offset - b.offset; } );

      this.terrainProfile
        .datum( this.terrainData );
    },

    updateTerrainPath: function( duration )
    {
      var opon = this.terrainProfile;

      if ( duration > 0 )
      {
        opon = opon
          .transition()
          .duration( duration );
      }

      opon
        .attr( 'd', this.terrainLine );
    },

    onClick: function( d, i )
    {
      console.info( "Click ");
      console.info( d3.event );
    },

    resetReaches: function()
    {
      var reachData = this.profile.selectAll( ".reach" )
        .data( [] );

      reachData.exit()
        .remove();
    },

    redraw: function( duration )
    {
      if( typeof(duration) === 'undefined' ) duration = 750;

      this.updateReaches( duration );
      this.updateSpecialStructures( duration );
      this.updateTerrainPath( duration );
    }
  });

  /*
   * When the DOM becomes ready, run some init code
   */

  ready(function(){
    // Create the profile we need
    qgep.profilePlot = new qgep.def.ProfilePlot();
    qgep.profilePlot.initSVG( d3.select("body") );

    // profileProxy is our bridge to the QGEP plugin. It's inserted with teh use of black magic (and pyQt/QtWebKit bridge)
    //profileProxy.profileChanged.connect( dojo.hitch( qgep.profilePlot, qgep.profilePlot.createReaches, dojo.fromJson( arguments[0] ) ) );
    if ( typeof profileProxy != 'undefined' )
    {
      profileProxy.profileChanged.connect(
        function(data) {
          var profileData = dojo.fromJson(data);
          console.log( "Profile data: ");
          console.log( profileData );
          qgep.data = profileData;
          var reachData = profileData.filter ( function(d) { return d.type == 'reach'; } );
          qgep.profilePlot.createReaches( reachData );
          var specialStructureData = profileData.filter ( function(d) { return d.type == 'special_structure'; } );
//          console.log( specialStructureData );
          qgep.profilePlot.createSpecialStructures( specialStructureData );

          var coverData = profileData.filter( function(d) { return d.type == 'node'; } );
          qgep.profilePlot.createTerrainPath( coverData );

          qgep.profilePlot.scaleDomain();
          qgep.profilePlot.redraw();
        }
      );
    }
  });
});
