-- View: qgep.vw_network_node

DROP VIEW IF EXISTS qgep.vw_network_node;

CREATE OR REPLACE VIEW qgep.vw_network_node AS 
 SELECT 
   row_number() OVER () AS gid,
   nodes.*
 FROM
 (
   SELECT 
     obj_id,
     'reach_point' AS type,
     'reach_point' AS node_type,
     level AS level,
     NULL AS usage_current,
     NULL AS cover_level,
     NULL AS description,
     situation_geometry AS detail_geometry,
     situation_geometry
   FROM qgep.od_reach_point
 
   UNION
 
   SELECT 
     wwne.obj_id,
     'wastewater_node' AS type,
     CASE 
       WHEN mh.obj_id IS NOT NULL
         THEN 'manhole'
       WHEN str.obj_id IS NOT NULL
         THEN 'special_structure'
       ELSE 'other'
     END AS node_type,
     bottom_level AS level,
     COALESCE( MAX( ch_from.usage_current ), MAX( ch_to.usage_current ) ) AS usage_current,
     c.level AS cover_level,
     wwne.identifier AS description,
     COALESCE( str.detail_geometry_geometry, wwno.situation_geometry ) AS detail_geometry, -- Will contain different geometry types: do not visualize directly. Will be handled by plugin
     wwno.situation_geometry
   FROM qgep.od_wastewater_node wwno
   LEFT JOIN qgep.od_wastewater_networkelement wwne
     ON wwne.obj_id = wwno.obj_id
   LEFT JOIN qgep.od_wastewater_structure str
     ON str.obj_id = wwno.obj_id
   LEFT JOIN qgep.od_manhole mh
     ON mh.obj_id = wwno.obj_id
   LEFT JOIN qgep.od_cover c
     ON c.obj_id = wwno.obj_id
   LEFT JOIN qgep.od_reach_point rp 
     ON wwne.obj_id = rp.fs_wastewater_networkelement
   LEFT JOIN qgep.od_reach re_from 
     ON re_from.fs_reach_point_from = rp.obj_id
   LEFT JOIN qgep.od_channel ch_from
     ON ch_from.obj_id = re_from.obj_id
   LEFT JOIN qgep.od_reach re_to 
     ON re_to.fs_reach_point_to = rp.obj_id
   LEFT JOIN qgep.od_channel ch_to
     ON ch_to.obj_id = re_to.obj_id
   GROUP BY wwne.obj_id, type, bottom_level, cover_level, description, wwno.situation_geometry, str.detail_geometry_geometry, str.obj_id, mh.obj_id
  ) AS nodes
