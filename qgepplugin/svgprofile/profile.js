/**
 * Date: 28.10.12
 * Copyright(C) 2012 Matthias Kuhn 
 * matthias dot kuhn (at) gmx dot ch
 *
 *
 * licensed under the terms of GNU GPL 2
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
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

// Global Object, where we'll declare all the useful stuff inside
var qgep = { def: {}, test: {} };

require( ["dojo/on", "dojo/ready", "dojo/_base/json", "profile/specialStructure", "profile/reach", "profile/terrain"], function(  on, ready, dojo, SpecialStructure, Reach, Terrain ) {

  qgep.def.ProfilePlot = dojo.declare( null,
  {
    verticalExaggeration: 5,

    margin: 10,

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

    myZoom: d3.behavior.zoom(),

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
        .attr( "class", "profile" )
        .call( this.myZoom );

      // TODO: make resize more intelligent so it gets proper axis bounds already on first init
      this.onResize();
      this.onResize();

      //  Subscribe to window resize event
      on( window, "resize", dojo.hitch( this, this.onResize ) );

      this.specialStructure = new SpecialStructure({
        svgProfile: this.profile,
        x: this.x,
        y: this.y
      });

      this.reach = new Reach({
        svgProfile: this.profile,
        x: this.x,
        y: this.y
      });

      this.terrain = new Terrain({
        svgProfile: this.profile,
        x: this.x,
        y: this.y
      })
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
      this.myZoom.scale(1);
      this.myZoom.translate([0,0]);

      var rExt = this.reach.extent();
      var sExt = this.specialStructure.extent();
      var xExtent = [ d3.min([rExt.x[0], sExt.x[0]]), d3.max([rExt.x[1], sExt.x[1]]) ];
      this.x.domain( xExtent );
      var maxY = this.terrain.extent().y[1];
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
    },

    // zoom and pan operations
    zoom: function ()
    {
      this.transform( this.x, d3.event.translate[0], d3.event.scale );
      this.transform( this.y, d3.event.translate[1], d3.event.scale );

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

    redraw: function( duration )
    {
      if( typeof(duration) === 'undefined' ) duration = 750;

      this.reach.redraw( duration );
      this.specialStructure.redraw( duration );
      this.terrain.redraw( duration );
    }
  });

  qgep.test.clickReach = function( selector ) {
    event = document.createEvent('MouseEvents');
    event.initMouseEvent('click');
    elem = d3.select( selector )[0][0];
    elem.dispatchEvent(event);
  };

  /*
   * When the DOM becomes ready, run some init code
   */

  ready(function(){
    // Create the profile we need
    qgep.profilePlot = new qgep.def.ProfilePlot();
    qgep.profilePlot.initSVG( d3.select("body") );

    // profileProxy is our bridge to the QGEP plugin. It's inserted with teh use of black magic (and pyQt/QtWebKit bridge)
    //profileProxy.profileChanged.connect( dojo.hitch( qgep.profilePlot, qgep.profilePlot.createReaches, dojo.fromJson( arguments[0] ) ) );
    if ( typeof profileProxy !== 'undefined' )
    {
      profileProxy.profileChanged.connect(
        function(data) {
          console.info( 'profile Changed');
          var profileData = dojo.fromJson(data);
          console.log( "Profile data: ");
          console.log( profileData );
          qgep.data = profileData;
          var reachData = profileData.filter ( function(d) { return d.type == 'reach'; } );
          qgep.profilePlot.reach.data( reachData )
          var specialStructureData = profileData.filter ( function(d) { return d.type == 'special_structure'; } );
          qgep.profilePlot.specialStructure.data( specialStructureData );
          var coverData = profileData.filter( function(d) { return d.type == 'node'; } );
          qgep.profilePlot.terrain.data( coverData );

          qgep.profilePlot.scaleDomain();
          qgep.profilePlot.redraw();
        }
      );

      profileProxy.updateProfile();
    }
  });
});
