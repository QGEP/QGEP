/**
 * Created with JetBrains PhpStorm.
 * User: kk
 * Date: 11/29/12
 * Time: 9:07 AM
 * To change this template use File | Settings | File Templates.
 */

define([ "dojo/_base/declare", "dojo/_base/lang", "profile/profileElement" ], function (declare, lang, _ProfileElement) {
  return declare([ _ProfileElement ], {
    line: d3.svg.line(),
    terrain: null,

    constructor: function(/*Object*/ kwArgs)
    {
      lang.mixin( this, kwArgs );

      this.terrain = this.svgProfile.append( 'svg:path' )
        .attr( 'class', 'terrain' );

      this.line
        .x( lang.hitch( this, function( d ) { return this.x( d.offset ); } ) )
        .y( lang.hitch( this, function( d ) { return this.y( d.coverLevel ); } ) );
    },

    data: function( data )
    {
      var terrainData = data
        .filter( function( d ) { return d.coverLevel != null; } )
        .sort( function( a, b ) { return a.offset - b.offset; } );

      this.terrain
        .datum( terrainData );
    },

    redraw: function( duration )
    {
      var opon = this.terrain;

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
      var minX = d3.min( this.terrain.datum(), ƒ('offset') ) || 0;
      var maxX = d3.max( this.terrain.datum(), ƒ('offset') ) || 1;
      var minY = d3.min( this.terrain.datum(), ƒ('coverLevel') ) || 0;
      var maxY = d3.max( this.terrain.datum(), ƒ('coverLevel') ) || 1;

      return {x: [minX, maxX], y: [minY, maxY] };
    }
  });
});