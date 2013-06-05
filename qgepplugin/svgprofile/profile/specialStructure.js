/*
 * specialStructure.js
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


define([ "dojo/_base/declare", "dojo/_base/lang", "profile/profileElement" ], function (declare, lang, _ProfileElement) {
  "use strict";
  return declare( 'specialStructure', [ _ProfileElement ], {
    specialStructures: null, /* Reference to the current working set */
    line: d3.svg.line(),
    tooltip: d3.select( 'body' )
      .append( 'div' )
      .attr( 'class', 'tooltip' )
      .attr( 'id', 'special-structure-tooltip' ),

    constructor: function(/*Object*/ kwArgs)
    {
      lang.mixin(this, kwArgs);

      this.line
        .x( lang.hitch( this, function( d ) { return this.x( d.x ); } ) )
        .y( lang.hitch( this, function( d ) { return this.y( d.y ); } ) );
    },

    data: function( data )
    {
      // Preprocess data
      data.forEach(
        lang.hitch( this,
          function( d )
          {
            d.pathPoints = this.pathPoints( d );
          }
        )
      );

      console.info( data.filter( function (d) { return d.description == '6008.0130'; } ) );

      this.specialStructures = this.svgProfile
        .selectAll( '.special-structure' )
        .data( data, extract( 'objId' ) );

      var newSpecialStructures = this.specialStructures
        .enter()
        .append( 'svg:g' )
        .attr( 'id', function(d) { return d.objId; } )
        .attr( 'class', function(d) { return 'usage-current-' + d.usageCurrent; } )
        .classed( 'special-structure', true )
        .on( 'mouseover',
          lang.hitch( this,
            function(d)
            {
              profileProxy.onSpecialStructureMouseOver( d.objId );

              var type = 'Unknown';

              switch ( d.nodeType )
              {
                case 'manhole':
                  type = qsTr( 'Manhole', this );
                  break;

                case 'special_structure':
                  type = 'Special Structure';
                  break;
              }

              return this.tooltip
                .html(
                  '<h2>' + type + ': ' + d.objId + '</h2><br/>' +
                  '<strong>' + qsTr( 'Cover level:', this ) + '</strong> '  + this.formatMeters( d.coverLevel ) + '<br/>' +
                  '<strong>' + qsTr( 'Bottom level:', this ) + '</strong> ' + this.formatMeters( d.bottomLevel ) + '<br/>' +
                  '<strong>' + qsTr( 'Entry level:', this ) + '</strong> ' + this.formatMeters( d.startLevel ) + '<br/>' +
                  '<strong>' + qsTr( 'Exit level:', this ) + '</strong> '  + this.formatMeters( d.endLevel ) + '<br/>'
                )
                .style( 'top', lang.hitch( this, function() { return this.tooltipTop( this.tooltip ); } ) )
                .style( 'left', (event.pageX+10)+'px' )
                .style( 'opacity', 1 );

            }
          )
        )
        .on( 'mouseout',
          lang.hitch( this,
            function( d )
            {
              profileProxy.onSpecialStructureMouseOut( d.objId );

              return this.tooltip.transition().duration( 700 ).style( 'opacity', 0 );
            }
          )
        );

      newSpecialStructures
        .append( 'svg:path' );

      newSpecialStructures
        .append( 'svg:text' )
        .text( function( d ) { return d.description; } );

      this.specialStructures.exit()
        .transition()
        .duration( 300 )
        .attr( 'opacity' , 0 )
        .remove();

    },

    redraw: function( duration )
    {
      var texts = this.specialStructures.select( 'text' );
      // For some reason, select does propagate the __data__ down from the <g> to the <path> element
      // see http://stackoverflow.com/questions/10129432/inheritance-in-data-joins
      // For some unknown reason selectAll does not do this!!
      var paths = this.specialStructures.select( 'path' );

      if ( duration > 0 )
      {
        texts = texts
          .transition()
          .duration( duration );

        paths = paths
          .transition()
          .duration( duration );
      }

      texts
        .attr( 'transform',
          lang.hitch( this,
            function ( d )
            {
              return 'translate(' +
                ( this.x( ( d.endOffset + d.startOffset ) / 2 ) ) +
                ',' +
                ( this.y( d.coverLevel ) - 3 ) +
                ')' +
                'rotate(-80)';
            }
          )
        );

      paths
        .attr( 'd',
          lang.hitch( this,
            function( d )
            {
              return this.line( d.pathPoints ) +'Z';
            }
          )
        );
    },

    extent: function()
    {
      var minX = d3.min( this.specialStructures.data(), extract( 'startOffset' ) ) || 0;
      var maxX = d3.max( this.specialStructures.data(), extract( 'endOffset' ) ) || 1;
      var minY = d3.min( this.specialStructures.data(), extract( 'bottomLevel' ) ) || 0;
      var maxY = d3.max( this.specialStructures.data(), extract( 'coverLevel' ) ) || 1;

      return { x: [minX, maxX], y: [minY, maxY] };
    },

    pathPoints: function(d)
    {
      // TODO: remove this debugging stuff
      if ( qgep.p === undefined )
      {
        qgep.p = []
      }

      qgep.p.push( d );

      var x1 = d.startOffset;
      var y1 = d.coverLevel;
      var x2 = d.endOffset;
      var y2 = d.coverLevel;
      var x3 = d.endOffset;
      var y3 = d.endLevel;
      var x4 = d.wwNodeOffset;
      var y4 = d.bottomLevel;
      var x5 = d.startOffset;
      var y5 = d.startLevel;

      var corners = [
        { x: x1, y: y1 },
        { x: x2, y: y2 },
        { x: x3, y: y3 },
        { x: x4, y: y4 },
        { x: x5, y: y5 }
      ];

      var filteredCorners = corners.filter( function(d) { return d.x !== null && d.y !== null; } );

      return filteredCorners;
    }
  });
});