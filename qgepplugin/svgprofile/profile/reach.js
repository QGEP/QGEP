/**
 * Created with JetBrains PhpStorm.
 * User: kk
 * Date: 11/28/12
 * Time: 9:18 PM
 * To change this template use File | Settings | File Templates.
 */

define([ "dojo/_base/declare", "dojo/_base/lang", "profile/profileElement" ], function (declare, lang, _ProfileElement) {
  return declare([ _ProfileElement ], {
    reaches: null,
    line: d3.svg.line(),

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
        .data( data, ƒ( 'gid' ) );

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
        .datum( this.pathPoints )
        .classed( 'progression', true )
        .append( 'title' )
        .text( function(d) { return d.objId + '\nWidth:' + d.width_m; } );

      newReaches
        .selectAll( '.blind-connection' )
        .data( function(d) { return d.reachPoints; }, function(rp) { return rp.objId; } )
        .enter()
        .append( 'circle' )
        .attr( 'class', 'blind-connection')
        .attr( 'r', 3 )
        .attr( 'fill', 'red' );
    },

    redraw: function( duration )
    {
      // create new reaches
      var blindConnections = this.reaches.selectAll('.blind-connection');
      var paths = this.reaches.selectAll('path');

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
        .attr( 'd', lang.hitch( this, function(d) { return this.line(d) +'Z'; } ) );

      blindConnections
        .attr( 'cx', lang.hitch( this, function(d) { return this.x(d.offset); } ) )
        .attr( 'cy', lang.hitch( this, function(d) { return this.y(d.level); } ) );
    },

    extent: function()
    {
      var minX = d3.min( this.reaches.data(), ƒ('startOffset') ) || 0;
      var maxX = d3.max( this.reaches.data(), ƒ('endOffset') ) || 1;
      var minY = d3.min( this.reaches.data(), ƒ('endLevel') ) || 0;
      var maxY = d3.max( this.reaches.data(), ƒ('startLevel') ) || 1;

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