/**
 * Created with JetBrains PhpStorm.
 * User: kk
 * Date: 11/28/12
 * Time: 9:28 PM
 * To change this template use File | Settings | File Templates.
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