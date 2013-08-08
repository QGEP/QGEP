/**
 * profile.js
 *
 * Copyright (C) 2013  Matthias Kuhn
 * matthias [dot] kuhn [at] gmx [dot] ch
 *-----------------------------------------------------------
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
 * with this progsram; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 */


// Create a function that returns a particular property of its parameter.
// If that property is a function, invoke it (and pass optional params).
function extract( name )
{
  "use strict";
  var v, params = Array.prototype.slice.call(arguments, 1);
  return function (o)
  {
    return (typeof (v = o[name]) === 'function' ? v.apply(o, params) : v );
  };
}

// Return the first argument passed in
function I(d)
{
  "use strict";
  return d;
}

// Global Object, where we'll declare all the useful stuff inside
var qgep = { def: {}, test: {} };

require( ["dojo/on", "dojo/ready", "dojo/_base/json", "dojo/_base/lang", "profile/specialStructure", "profile/reach", "profile/surface"], function(  on, ready, dojo, lang, SpecialStructure, Reach, Surface ) {
  qgep.def.ProfilePlot = dojo.declare( null,
  {
    verticalExaggeration: 10,

    margin: 10,

    x: d3.scale.linear(),
    y: d3.scale.linear(),

    xAxis: d3.svg.axis()
      .scale( this.x )
      .tickSize( -this.height )
      .tickSubdivide( true ),
    yAxis: d3.svg.axis()
      .scale( this.y )
      .ticks( 4 )
      .orient( 'right' ),

    zoom: d3.behavior.zoom(),

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

      this.zoom
        .x( this.x )
        .y( this.y )
        .on( 'zoom', lang.hitch( this, this.zoomed ) );

      this.zoomRect = this.mainGroup.append( "svg:rect" )
        .attr( "class", "pane" )
        .classed( 'dont-print', true )
        .call( this.zoom );

      this.profileViewPort = this.mainGroup.append( "svg:g")
        .attr( "clip-path", "url(#profileMask)" );

      this.profile = this.profileViewPort.append( "svg:g" )
        .attr( "class", "profile" )
        .call( this.zoom );

      // TODO: make resize more intelligent so it gets proper axis bounds already on first init
      this.onResize();
      this.onResize();

      //  Subscribe to window resize event
      on( window, "resize", lang.hitch( this, this.onResize ) );

      // http://tjvantoll.com/2012/06/15/detecting-print-requests-with-javascript/
      if ( window.matchMedia )
      {
        var mediaQueryList = window.matchMedia( 'print' );
        mediaQueryList.addListener( lang.hitch( this, this.onPrint ) );
      }

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

      this.terrain = new Surface({
        svgProfile: this.profile,
        x: this.x,
        y: this.y,
        className: "terrain",
        xAttr: "offset",
        yAttr: "coverLevel"
      });

      this.backflow = new Surface({
        svgProfile: this.profile,
        x: this.x,
        y: this.y,
        className: "backflow",
        xAttr: "offset",
        yAttr: "backflowLevel"
      });
    },

    onPrint: function ( mql )
    {
      // only before print
      if ( mql.matches )
      {
        console.info( 'onbeforeprint' );
      }
    },

    onResize: function ()
    {
      // Get the size of the axis
      var xAxisHeight = d3.max( d3.select( 'g.x.axis' ), function (d) { return d.pop().getBoundingClientRect().height; } );
      var yAxisWidth = d3.max( d3.select( 'g.y.axis' ), function (d) { return d.pop().getBoundingClientRect().width; } );

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
//      this.zoom.scale(1);
//      this.zoom.translate([0,0]);

      var rExt = this.reach.extent();
      var sExt = this.specialStructure.extent();
      var xExtent = [ d3.min([rExt.x[0], sExt.x[0]]), d3.max([rExt.x[1], sExt.x[1]]) ];
      this.x.domain( xExtent );
      var maxY = this.terrain.extent().y[1];
      var minY = maxY - ( this.height * xExtent[1] ) / this.width / this.verticalExaggeration;
      this.y.domain([minY, maxY ]);

      this.zoom
        .x( this.x )
        .y( this.y );

      this.zoom
        .scale( 1 );
      this.zoom
        .translate( [0, 0] );

      this.mainGroup.select( 'g.x.axis' ).call( this.xAxis );
      this.mainGroup.select( 'g.y.axis' ).call( this.yAxis );

      this.redraw();
    },

    // zoom and pan operations
    zoomed: function ()
    {
      var dom = this.x.domain();
      var ran = this.x.range();

      var ddom = dom[1]-dom[0];
      var dran = ran[1]-ran[0];

      if ( ddom / dran < 0.2 )
      {
        this.profile
          .classed( 'scale-small', true )
          .classed( 'scale-large', false );
      }
      else
      {
        this.profile
          .classed( 'scale-small', false )
          .classed( 'scale-large', true );
      }

      this.mainGroup.select( 'g.x.axis' ).call( this.xAxis );
      this.mainGroup.select( 'g.y.axis' ).call( this.yAxis );

      this.redraw(0);
    },

    redraw: function( duration )
    {
      if( typeof(duration) === 'undefined' ) { duration = 750; }

      this.reach.redraw( duration );
      this.specialStructure.redraw( duration );
      this.terrain.redraw( duration );
      this.backflow.redraw( duration );
    }
  });

  qgep.test.clickReach = function( selector ) {
    var event = document.createEvent( 'MouseEvents' );
    event.initMouseEvent( 'click' );
    var elem = d3.select( selector )[0][0];
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
          var profileData = dojo.fromJson(data);
          qgep.data = profileData;
          var reachData = profileData.filter ( function(d) { return d.type === 'reach'; } );
          qgep.profilePlot.reach.data( reachData );
          var specialStructureData = profileData.filter ( function(d) { return d.type === 'special_structure'; } );
          qgep.profilePlot.specialStructure.data( specialStructureData );
          var nodeData = profileData.filter( function(d) { return d.type === 'node'; } );
          qgep.profilePlot.terrain.data( nodeData );
          qgep.profilePlot.backflow.data( nodeData );

          qgep.profilePlot.scaleDomain();
          qgep.profilePlot.redraw();
        }
      );

      profileProxy.verticalExaggerationChanged.connect(
        function(ve)
        {
          qgep.profilePlot.verticalExaggeration = ve;
          qgep.profilePlot.scaleDomain();
        }
      );

      profileProxy.updateProfile();
    }
  });
});
