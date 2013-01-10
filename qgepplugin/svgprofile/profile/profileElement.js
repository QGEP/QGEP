/**
 * profileElement.js
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

define([ "dojo/_base/declare" ], function (declare) {
  return declare([], {
    svgProfile: null,        /* Reference to the svg object */
    x: null,                 /* Reference to the d3 x scale */
    y: null,                 /* Reference to the d3 y scale */

    data: function (data) {

    },

    redraw: function (duration) {

    },

    extent: function () {
      /* xmin, xmax, ymin, ymax */
      return { x: [0, 1], y: [0, 1] };
    },

    tooltipTop: function( tt ) {
      var height = d3.select("body").property( 'clientHeight' );
      tt.classed( 'dont-print', true );
      tt.attr('top');
      var ttHeight = tt.property( 'clientHeight' );

      if ( height - ttHeight > event.pageY - 10 )
      {
        return event.pageY - 10 + 'px';
      }
      else
      {
        return height - ttHeight + 'px';
      }
    },

    formatMeters: function(n, decimal_places, multiplier, suffix) {
      if ( n === null )
      {
        return '<i>Undefined</i>';
      }
      if ( multiplier === undefined )
      {
        multiplier = 1;
      }
      if ( suffix === undefined )
      {
        suffix = 'm';
      }
      if ( decimal_places === undefined )
      {
        decimal_places = 2;
      }

      var rf = Math.pow( 10, decimal_places );

      return Math.round( n * multiplier * rf ) / rf + ' ' + suffix;
    }
  });
});