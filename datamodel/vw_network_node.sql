-- View: qgep.vw_reach_point

-- DROP VIEW qgep.vw_reach_point;

CREATE OR REPLACE VIEW qgep.vw_network_node AS 
 SELECT 
   row_number() OVER () AS gid,
   nodes.*
   FROM
   (
   SELECT 
   obj_id,
   'reach_point' AS type,
   level AS level,
   situation_geometry
   FROM qgep.od_reach_point
   
   UNION
   
   SELECT 
   obj_id,
   'wastewater_node' AS type,
   bottom_level AS level,
   situation_geometry
   FROM qgep.od_wastewater_node
   ) AS nodes