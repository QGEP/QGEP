/**
 * reach.js
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


define([ "dojo/_base/declare", "dojo/_base/lang", "profile/profileElement" ], function ( declare, lang, _ProfileElement ) {
  "use strict";

  return declare( 'reach', [ _ProfileElement ], {
    reaches: null,
    line: d3.svg.line(),
    tooltip: d3.select('body')
      .append( 'div' )
      .attr('class', 'tooltip')
      .attr('id', 'reach-tooltip'),

    constructor: function(/*Object*/ kwArgs)
    {
      lang.mixin( this, kwArgs );

      this.line
        .x( lang.hitch( this, function(d) { return this.x( d.x ); } ) )
        .y( lang.hitch( this, function(d) { return this.y( d.y ); } ) );
    },

    data: function( data )
    {
      this.reaches = this.svgProfile.selectAll('.reach')
        .data( data, extract( 'gid' ) );

      this.reaches
        .exit()
        .transition()
        .duration(300)
        .attr('opacity',0)
        .remove();

      var newReaches = this.reaches
        .enter()
        .append('svg:g')
        .attr( 'id', function(d) { return d.objId; } )
        .attr( 'class', function(d) { return 'usage-current-' + d.usageCurrent; } )
        .classed( 'reach', true )
        .on('click', function(d) { profileProxy.onReachClicked( d.objId ); });

      newReaches
        .append('svg:path')
        .attr( 'class', 'progression' )
        .on( 'mouseover',
          lang.hitch( this,
            function(d)
            {
              profileProxy.onReachMouseOver( d.objId );

              return this.tooltip
                .html(
                  '<h2>' + qsTr( 'Reach', this ) + ' ' + d.objId + '</h2><br/>' +
                  '<strong>' + qsTr( 'Material:', this ) + '</strong> ' + d.material + '<br/>' +
                  '<strong>' + qsTr( 'Width:', this ) + '</strong> ' + this.formatMeters( d.width_m, 0, 1000, 'mm' ) + '<br/>' +
                  '<strong>' + qsTr( 'Length:', this ) + '</strong> ' + this.formatMeters( d.length ) + '<br/>' +
                  '<strong>' + qsTr( 'Gradient:', this ) + '</strong> ' + Math.round( d.gradient * 10000 ) / 10 + ' ‰<br/>' +
                  '<strong>' + qsTr( 'Entry level:', this ) + '</strong> ' + this.formatMeters( d.startLevel ) + '<br/>' +
                  '<strong>' + qsTr( 'Exit level:', this ) + '</strong> ' + this.formatMeters( d.endLevel )
                )
                .style('top', lang.hitch( this, function() { return this.tooltipTop( this.tooltip ); } ) )
                .style('left', (event.pageX+10)+'px')
                .style( 'opacity', 1 );
            }
          )
        )
        .on( 'mouseout',
          lang.hitch( this,
            function( d )
            {
              profileProxy.onReachMouseOut( d.objId );

              return this.tooltip.transition().duration( 700 ).style( 'opacity', 0 );
            }
          )
        );

      this.reaches
        .datum(
          lang.hitch( this,
            function(d)
            {
              d.pathPoints = this.pathPoints(d);
              return d;
            }
          )
        );

      /* Blind connections */
      this.reaches
        .selectAll( '.blind-connection' )
        .data(
          function(d) {
            /* Do only show blind connections. offset 0 and 1 are normally special structures.*/
            var drp = d.reachPoints.filter(
              function(rp) { return rp.offset !== 0 && rp.offset !== 1; }
            );

            /* Assign backreference to reach to each reachpoint */
            drp.forEach(
              function(rp) { rp.reach = d; }
            );

            return drp;
          },
        /* Id's for the reachopints are their respective objId */
          function(rp) { return rp.objId; }
        )
        .enter()
        .append( 'circle' )
        .attr( 'class', 'blind-connection')
        .attr( 'r', '5' )
        .on( 'mouseover',
          lang.hitch( this,
            function(d)
            {
              profileProxy.onReachPointMouseOver( d.objId, d.reach.objId );
            }
          )
        )
        .on( 'mouseout',
          lang.hitch( this,
            function(d)
            {
              profileProxy.onReachPointMouseOut(d.objId, d.reach.objId );
            }
          )
        );
    },

    redraw: function( duration )
    {
      // create new reaches
      var blindConnections = this.reaches.selectAll('.blind-connection');
      // For some reason, select does propagate the __data__ down from the g to the path element
      // see http://stackoverflow.com/questions/10129432/inheritance-in-data-joins
      // For some unknown reason selectAll does not do this!!
      var paths = this.reaches.select('path');

      if ( duration > 0 )
      {
        paths = paths
          .transition()
          .duration(duration);

        blindConnections = blindConnections
          .transition()
          .duration(duration);
      }

      paths
        .attr( 'd', lang.hitch( this, function(d) { return this.line(d.pathPoints) +'Z'; } ) );

      blindConnections
        .attr( 'cx', lang.hitch( this, function(d) { return this.x(d.offset); } ) )
        .attr( 'cy', lang.hitch( this, function(d) { return this.y(d.level); } ) );
    },

    extent: function()
    {
      var minX = d3.min( this.reaches.data(), extract('startOffset') ) || 0;
      var maxX = d3.max( this.reaches.data(), extract('endOffset') ) || 1;
      var minY = d3.min( this.reaches.data(), extract('endLevel') ) || 0;
      var maxY = d3.max( this.reaches.data(), extract('startLevel') ) || 1;

      return {x: [minX, maxX], y: [minY, maxY] };
    },

    pathPoints: function(d)
    {
      var endLevel = d.endLevel ? d.endLevel : d.startLevel;
      var startLevel = d.startLevel ? d.startLevel : d.endLevel;

      var dy = d.width_m * Math.sqrt(Math.pow(( d.endOffset- d.startOffset ), 2) + Math.pow(( startLevel- endLevel ), 2)) / ( d.endOffset- d.startOffset );
      var x1, x2, x3, x4;
      var y1, y2, y3, y4;
      x1 = x2 = d.startOffset;
      x3 = x4 = d.endOffset;
      y1 = startLevel;
      y2 = startLevel + dy;
      y4 = endLevel;
      y3 = endLevel + dy;

      var points = [
        {x: x1, y: y1 },
        {x: x2, y: y2 },
        {x: x3, y: y3 },
        {x: x4, y: y4 }
      ];

      return points;
    }
  });
});