/**
 * Created with JetBrains PhpStorm.
 * User: kk
 * Date: 11/29/12
 * Time: 9:07 AM
 * To change this template use File | Settings | File Templates.
 */

define([ "dojo/_base/declare", "dojo/_base/lang", "profile/profileElement" ], function (declare, lang, _ProfileElement) {
  return declare([ _ProfileElement ], {
    line: null,
    surface: null,
    className: "surface",
    xAttr: undefined,
    yAttr: undefined,

    constructor: function(/*Object*/ kwArgs)
    {
      lang.mixin( this, kwArgs );

      this.line = d3.svg.line();

      this.surface = this.svgProfile.append( 'svg:path' )
        .attr( 'class', this.className );

      this.line
        .x( lang.hitch( this, function( d ) { return this.x( d[this.xAttr] ); } ) )
        .y( lang.hitch( this, function( d ) { return this.y( d[this.yAttr] ); } ) );
    },

    data: function( data )
    {
      var surfaceData = data
        .filter( lang.hitch( this, function( d ) { return d[this.yAttr] != null; } ) )
        .sort( lang.hitch( this, function( a, b ) { return a[this.xAttr] - b[this.xAttr]; } ) );

      this.surface
        .datum( surfaceData );
    },

    redraw: function( duration )
    {
      var opon = this.surface;

      if ( duration > 0 )
      {
        opon = opon
          .transition()
          .duration( duration );
      }

      opon
        .attr( 'd', this.line );
    },

    extent: function()
    {
      var minX = d3.min( this.surface.datum(), extract( this.xAttr ) ) || 0;
      var maxX = d3.max( this.surface.datum(), extract( this.xAttr ) ) || 1;
      var minY = d3.min( this.surface.datum(), extract( this.yAttr ) ) || 0;
      var maxY = d3.max( this.surface.datum(), extract( this.yAttr ) ) || 1;

      return {x: [minX, maxX], y: [minY, maxY] };
    }
  });
});
