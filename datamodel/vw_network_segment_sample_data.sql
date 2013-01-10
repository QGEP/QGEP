-- View: qgep.vw_network_segment_small

DROP VIEW IF EXISTS qgep.vw_network_segment_small;

CREATE OR REPLACE VIEW qgep.vw_network_segment_small AS 
 SELECT *
   FROM qgep.vw_network_segment
  WHERE contains(geometryfromtext('POLYGON((749765 263730, 749765 263600, 749909 263600,749909 263730 , 749765 263730))'::text, 21781), vw_network_segment.progression_geometry);
