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
var qgep = { class: {} };

require( ["dojo/on", "dojo/ready"], function(  on, ready ) {

  qgep.class.ProfilePlot = dojo.declare( null,
  {
    margin: 10,
    reachData: [],
    x: d3.scale.linear(),
    y: d3.scale.linear(),
    xAxis: d3.svg.axis().scale(this.x).tickSize(-this.height).tickSubdivide(true),
    yAxis: d3.svg.axis().scale(this.y).ticks(4).orient("right"),
    verticalExaggeration: 5,


    initSVG: function( parent )
    {
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

      this.zoomRect = this.mainGroup.append( "svg:rect" )
        .attr( "class", "pane" )
        .call( d3.behavior.zoom().on( "zoom", dojo.hitch( this, this.zoom ) ) );

      this.profileViewPort = this.mainGroup.append( "svg:g")
        .attr( "clip-path", "url(#profileMask)" );

      this.profile = this.profileViewPort.append( "svg:g" )
        .attr( "class", "profile" );

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
      this.y.domain([d3.min(this.data, ƒ('endLevel')), d3.max(this.data, ƒ('startLevel'))]).nice();

      this.mainGroup.select("g.x.axis").call(this.xAxis);
      this.mainGroup.select("g.y.axis").call(this.yAxis);
    },

    // Animation to change scale
    changeScale: function ()
    {
      var t = this.mainGroup.transition().duration(750);
      t.select(".x.axis").call(this.xAxis);
      t.select(".reach").attr('d', area( this.reachData ) );
      t.select(".y.axis").call(this.yAxis);
    },

    // zoom and pan operations
    zoom: function ()
    {
      this.transform( this.x, d3.event.translate[0], d3.event.scale );
      this.transform( this.y, d3.event.translate[1], d3.event.scale );

      this.profile
        .attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");

      this.mainGroup.select("g.x.axis").call(this.xAxis);
      this.mainGroup.select("g.y.axis").call(this.yAxis);
    },

    // Copied from an old d3js source file
    transform: function (scale, o, k) {
      var domain = scale.__domain || (scale.__domain = scale.domain()),
        range = scale.range().map(function(v) { return (v - o) / k; });
      scale.domain(domain).domain(range.map(scale.invert));
    },

    // Data: reaches
    createReaches: function ( data )
    {
      // Save the data
      this.data = data;

      // select data
      this.reachData = this.profile.selectAll(".reach")
        .data( data );

      this.scaleDomain();

      // create new reaches
      var that = this;
      var reachGroups = this.reachData.enter()
        .append('svg:g');

        reachGroups
        .append('line')
        .attr( 'x1', function(d) { return that.x( d.startOffset ); } )
        .attr( 'x2', function(d) { return that.x( d.endOffset ); } )
        .attr( 'y1', function(d) { return that.y( d.startLevel - d.width_m/2 ); } )
        .attr( 'y2', function(d) { return that.y( d.endLevel - d.width_m/2 ); } )
        .attr( 'class', 'reach' )
        .style( "stroke" , ƒ('usage_current_color') )
        .on( dojo.hitch( this, this.onClick ), 'click' );

        reachGroups
        .append('line')
        .attr( 'x1', function(d) { return that.x( d.startOffset ); } )
        .attr( 'x2', function(d) { return that.x( d.endOffset ); } )
        .attr( 'y1', function(d) { return that.y( d.startLevel + d.width_m/2 ); } )
        .attr( 'y2', function(d) { return that.y( d.endLevel + d.width_m/2 ); } )
        .attr( 'class', 'reach' )
        .style( "stroke" , ƒ('usage_current_color') );
//        .style("stroke-width", function(d) { return that.y( d.width_m ); } );
    },

    onClick: function( d, i )
    {
      console.info( "Click ");
      console.info( d3.event );
    },

    resetReaches: function()
    {
      this.data = [];
      this.reachData = this.profile.selectAll( ".reach" )
        .data( this.data );

      this.reachData.exit()
        .remove();
    }
  });

  /*
   * When the DOM becomes ready, run some init code
   */

  ready(function(){
    // Create the profile we need
    qgep.profilePlot = new qgep.class.ProfilePlot();
    qgep.profilePlot.initSVG( d3.select("body") );

    // profileProxy is our bridge to the QGEP plugin. It's inserted with teh use of black magic (and pyQt/QtWebKit bridge)
    //profileProxy.profileChanged.connect( dojo.hitch( qgep.profilePlot, qgep.profilePlot.createReaches, dojo.fromJson( arguments[0] ) ) );
    if ( typeof profileProxy != 'undefined' )
    {
      profileProxy.profileChanged.connect(
        function(a) {
          qgep.profilePlot.resetReaches();
          qgep.profilePlot.createReaches(dojo.fromJson(a));
        }
      );
    }
  });
});