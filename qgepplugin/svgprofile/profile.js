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
        .x(this.x)
        .y(this.y)
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
      // Compute the minimum and maximum offset, and the maximum level.
      this.x.domain([0, this.data[this.data.length - 1].endOffset]);
      var maxY = d3.max(this.terrainData, ƒ('coverLevel'));
      minY = maxY - this.x.invert( maxY ) / this.verticalExaggeration;
      this.y.domain([minY, maxY ]);

      this.myZoom.scale(1);
      this.myZoom.translate([0,0]);

      this.mainGroup.select("g.x.axis").call(this.xAxis);
      this.mainGroup.select("g.y.axis").call(this.yAxis);
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
/*    this.transform( this.x, d3.event.translate[0], d3.event.scale );
      this.transform( this.y, d3.event.translate[1], d3.event.scale );
*/
      this.profile
        .attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");

      this.mainGroup.select("g.x.axis").call(this.xAxis);
      this.mainGroup.select("g.y.axis").call(this.yAxis);
      console.log("zoom: " + d3.event.scale);
      console.log("translate: " + d3.event.translate);
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
      this.resetReaches();
      this.reachData = data;
      this.updateReaches();
    },

    updateReaches: function()
    {
      // select data
      var reaches = this.profile.selectAll(".reach")
        .data( this.reachData );

      // create new reaches
      var that = this;

      var newReaches = reaches
        .enter()
        .append('svg:g');

      newReaches
        .append('polygon')
        .attr( 'class', 'reach' )
        .style( "stroke" , function(d) { return '#dd00dd'; } )
        .on( dojo.hitch( this, this.onClick ), 'click' )
        .append('title')
        .text( function(d) { return 'Reach\nWidth:' + d.width_m; } );

      reaches.selectAll('polygon')
        .transition()
        .duration(750)
        .attr( 'points', function(d)
        {
          d.width_m = 0.5;
          var x1, x2, x3, x4;
          var y1, y2, y3, y4;
          x1 = x2 = that.x( d.startOffset );
          x3 = x4 = that.x( d.endOffset );
          y1 = that.y( d.startLevel );
          y2 = that.y( d.startLevel + d.width_m );
          y4 = that.y( d.endLevel );
          y3 = that.y( d.endLevel + d.width_m );

          var pstr = [
            d.startOffset + ',' + d.startLevel,
            d.startOffset + ',' + (d.startLevel + d.width_m),
            d.endOffset + ',' + (d.endLevel + d.width_m),
            d.endOffset + ',' + d.endLevel
          ].join(' ');

          var pointstr = [
            x1 + ',' + y1,
            x2 + ',' + y2,
            x3 + ',' + y3,
            x4 + ',' + y4
          ].join(' ');

          console.info( 'original: ' + pstr );
          console.info( 'transformed: ' + pointstr );
          return pointstr;
        } );

      /*
      reachGroups
        .append('line')
        .attr( 'x1', function(d) { return that.x( d.startOffset ); } )
        .attr( 'x2', function(d) { return that.x( d.endOffset ); } )
        .attr( 'y1', function(d) { return that.y( d.startLevel + d.width_m ); } )
        .attr( 'y2', function(d) { return that.y( d.endLevel + d.width_m ); } )
        .attr( 'class' , function(d) { return 'reach usage-current-' + d.usage_current; } );
        .style("stroke-width", function(d) { return that.y( d.width_m ); } );
      */
    },

    // Data: special structures
    createSpecialStructures: function ( data )
    {
      this.resetSpecialStructures();
      this.data = data;
      // select data
      this.specialStructureData = this.profile.selectAll(".special-structure")
        .data( data );

      // create new reaches
      var that = this;
      var specialStructureGroups = this.specialStructureData.enter()
        .append('svg:g');

      specialStructureGroups
        .append('svg:rect')
        .attr('x',      function(d) { return that.x( d.startOffset ); } )
        .attr('y',      function(d) { return that.y( d.coverLevel ); } )
        .attr('width',  function(d) { return that.x( d.endOffset - d.startOffset ); } )
        .attr('height', function(d) { return that.y( d.bottomLevel ) - that.y( d.coverLevel ); } )
        .attr( 'class', 'special-structure' );
    },

    createTerrainPath: function( data )
    {
      this.terrainData = data.filter( function(d) { return d.coverLevel != null; } );

      this.scaleDomain();

      this.terrainProfile
        .datum( this.terrainData )
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

    resetSpecialStructures: function()
    {
      var specialStructures = this.profile.selectAll( ".special-structure" )
        .data( [] );

      specialStructures.exit()
        .remove();
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
          qgep.data = profileData;
          var reachData = profileData.filter ( function(d) { return d.type == 'reach'; } );
//          console.log( reachData );
          qgep.profilePlot.createReaches( reachData );
          var specialStructureData = profileData.filter ( function(d) { return d.type == 'special_structure'; } );
//          console.log( specialStructureData );
          qgep.profilePlot.createSpecialStructures( specialStructureData );

          var coverData = profileData.filter( function(d) { return d.type == 'node'; } );
          qgep.profilePlot.createTerrainPath( coverData );
        }
      );
    }
  });
});
