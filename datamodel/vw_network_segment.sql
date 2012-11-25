-- View: qgep.vw_network_segment

--DROP VIEW qgep.vw_network_segment;

CREATE VIEW qgep.vw_network_segment AS
 WITH reach_parts AS (
   SELECT 
     row_number() OVER (ORDER BY od_reach_point.fs_wastewater_networkelement, st_line_locate_point(st_linemerge(od_reach.progression), od_reach_point.situation_geometry)) AS gid, 
     od_reach_point.obj_id, 
     od_reach_point.fs_wastewater_networkelement, 
     od_reach_point.situation_geometry, 
     od_reach.progression, 
     od_reach.fs_reach_point_from, 
     od_reach.fs_reach_point_to, 
     st_linemerge(od_reach.progression) AS reach_progression, 
     st_line_locate_point(
       st_linemerge(od_reach.progression), 
       od_reach_point.situation_geometry
     ) AS pos
   FROM qgep.od_reach_point
   LEFT JOIN qgep.od_reach ON od_reach_point.fs_wastewater_networkelement::text = od_reach.obj_id::text
   WHERE od_reach_point.fs_wastewater_networkelement IS NOT NULL AND od_reach.progression IS NOT NULL
   ORDER BY od_reach_point.obj_id, st_line_locate_point(st_linemerge(od_reach.progression), od_reach_point.situation_geometry)
 )

 SELECT row_number() OVER () AS gid,
   parts.*
 FROM
 (
   SELECT 
     od_reach.obj_id,
     'reach' AS type,
     depth,
     ST_LENGTH( COALESCE( reach_progression, progression ) ) AS length_calc,
     COALESCE( from_obj_id, fs_reach_point_from ) AS from_obj_id,
     COALESCE( to_obj_id, fs_reach_point_to ) AS to_obj_id,
     fs_reach_point_from AS from_obj_id_interpolate,
     fs_reach_point_to AS to_obj_id_interpolate,
     COALESCE( from_pos, 0 ) AS from_pos,
     COALESCE( to_pos, 1 ) AS to_pos,
     NULL AS bottom_level,
     ch.usage_current AS usage_current,
     COALESCE( reach_progression, st_linemerge(progression) ) AS progression_geometry
   FROM qgep.od_reach
   FULL JOIN
   (
     SELECT 
       COALESCE(s1.fs_wastewater_networkelement, s2.fs_wastewater_networkelement) AS reach_obj_id, 
       COALESCE(s1.obj_id, s2.fs_reach_point_from) AS from_obj_id, 
       COALESCE(s2.obj_id, s1.fs_reach_point_to) AS to_obj_id, 
       COALESCE(s1.pos, 0::double precision) AS from_pos, 
       COALESCE(s2.pos, 1::double precision) AS to_pos, 
       st_line_substring(COALESCE(s1.reach_progression, s2.reach_progression), 
       COALESCE(s1.pos, 0::double precision), COALESCE(s2.pos, 1::double precision)) AS reach_progression
     FROM reach_parts s1
     FULL JOIN reach_parts s2 ON s1.gid = (s2.gid - 1) AND s1.fs_wastewater_networkelement::text = s2.fs_wastewater_networkelement::text
     ORDER BY COALESCE(s1.fs_wastewater_networkelement, s2.fs_wastewater_networkelement), COALESCE(s1.pos, 0::double precision)
   ) AS rr
   ON rr.reach_obj_id = od_reach.obj_id
   LEFT JOIN qgep.od_channel ch ON ch.obj_id = od_reach.obj_id

   UNION 

   SELECT 
     connectors.obj_id AS obj_id,
     'special_structure' AS type,
     NULL AS depth,
     ST_Length( progression_geometry ) AS length_calc,
     from_obj_id,
     to_obj_id,
     from_obj_id AS from_obj_id_interpolate,
     to_obj_id AS to_obj_id_interpolate,
     0 AS from_pos,
     1 AS to_pos,
     bottom_level,
     NULL AS usage_current,
     progression_geometry

   FROM 
   (
     SELECT 
     wn_from.obj_id AS obj_id,
     wn_from.obj_id AS from_obj_id,
     rp_from.obj_id AS to_obj_id,
     wn_from.bottom_level AS bottom_level,
     ST_LineFromMultiPoint( ST_Collect(wn_from.situation_geometry, rp_from.situation_geometry ) ) AS progression_geometry
     FROM qgep.od_reach
       LEFT JOIN qgep.od_reach_point rp_from ON rp_from.obj_id = od_reach.fs_reach_point_from
       LEFT JOIN qgep.od_wastewater_node wn_from ON rp_from.fs_wastewater_networkelement = wn_from.obj_id
     WHERE 
       od_reach.fs_reach_point_from IS NOT NULL
       AND
       wn_from.obj_id IS NOT NULL

     UNION

     SELECT 
       wn_to.obj_id AS obj_id,
       rp_to.obj_id AS from_obj_id,
       wn_to.obj_id AS to_obj_id,
       wn_to.bottom_level AS bottom_level,
       ST_LineFromMultiPoint( ST_Collect(rp_to.situation_geometry, wn_to.situation_geometry ) ) AS progression_geometry
     FROM qgep.od_reach
       LEFT JOIN qgep.od_reach_point rp_to ON rp_to.obj_id = od_reach.fs_reach_point_to
       LEFT JOIN qgep.od_wastewater_node wn_to ON rp_to.fs_wastewater_networkelement = wn_to.obj_id
     WHERE 
       od_reach.fs_reach_point_to IS NOT NULL
     AND
       wn_to.obj_id IS NOT NULL
   ) AS connectors
   LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.obj_id = connectors.obj_id 
 ) AS parts
WHERE GeometryType(progression_geometry) <> 'GEOMETRYCOLLECTION'
