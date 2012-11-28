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
    zoom: null,              /* Reference to a d3 zoom behavior object */

    data: function (data) {

    },

    redraw: function (duration) {

    },

    extent: function () {
      /* xmin, xmax, ymin, ymax */
      return [0, 1, 0, 1];
    }
  });
});