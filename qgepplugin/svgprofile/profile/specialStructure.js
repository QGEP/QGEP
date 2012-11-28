/**
 * Created with JetBrains PhpStorm.
 * User: kk
 * Date: 11/28/12
 * Time: 9:18 PM
 * To change this template use File | Settings | File Templates.
 */

define([ "dojo/_base/declare", "dojo/_base/lang", "profile/profileElement" ], function (declare, lang, _ProfileElement) {
  return declare([ _ProfileElement ], {
    specialStructures: null, /* Reference to the current working set */

    constructor: function(/*Object*/ kwArgs)
    {
      lang.mixin(this, kwArgs);
    },

    data: function( data )
    {
      this.specialStructures = this.svgProfile
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
        .attr( 'id', function(d) { return d.objId; } )
        .attr( 'class', function(d) { return 'usage-current-' + d.usageCurrent; } )
        .classed( 'special-structure', true )
        .call( this.zoom );

      newSpecialStructures
        .append('svg:rect');

      newSpecialStructures
        .append('svg:text')
        .text( function(d) { return d.description; } );
    },

    redraw: function( duration )
    {
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
        .attr( 'x', lang.hitch( this, function (d) { return this.x( (d.endOffset + d.startOffset)/2 ); } ) )
        .attr( 'y', lang.hitch( this, function (d) { return this.y( d.coverLevel ) - 3; } ) );

      oponRect
        .attr('x',      lang.hitch( this, function(d) { return this.x( d.startOffset ); } ) )
        .attr('y',      lang.hitch( this, function(d) { return this.y( d.coverLevel ); } ) )
        .attr('width',  lang.hitch( this, function(d) { return this.x( d.endOffset ) - this.x( d.startOffset ); } ) )
        .attr('height', lang.hitch( this, function(d) { return this.y( d.bottomLevel ) - this.y( d.coverLevel ); } ) );
    }
  });
});