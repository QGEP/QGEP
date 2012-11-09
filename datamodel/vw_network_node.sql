-- View: qgep.vw_network_node

DROP VIEW qgep.vw_network_node;

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
     NULL AS cover_level,
     NULL AS description,
     situation_geometry
   FROM qgep.od_reach_point
 
   UNION
 
   SELECT 
     wwne.obj_id,
     'wastewater_node' AS type,
     bottom_level AS level,
     c.level AS cover_level,
     wwne.identifier AS description,
     wwno.situation_geometry
   FROM qgep.od_wastewater_node wwno
   LEFT JOIN qgep.od_wastewater_networkelement wwne
   ON wwne.obj_id = wwno.obj_id
   LEFT JOIN qgep.od_cover c
   ON c.obj_id = wwno.obj_id
 ) AS nodes