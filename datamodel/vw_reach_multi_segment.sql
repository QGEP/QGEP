-- View: qgep.vw_reach_multi_segment

DROP VIEW qgep.vw_reach_multi_segment;

CREATE OR REPLACE VIEW qgep.vw_reach_multi_segment AS 
-- create a table with segments to work on
WITH segments AS (
  SELECT
    row_number() OVER (ORDER BY od_reach_point.fs_wastewater_networkelement, st_line_locate_point(st_linemerge(od_reach.progression), od_reach_point.situation_geometry)) AS gid, 
    od_reach_point.obj_id, 
    od_reach_point.fs_wastewater_networkelement, 
    st_linemerge(od_reach.progression) AS reach_progression, 
    st_line_locate_point(st_linemerge(od_reach.progression), 
    od_reach_point.situation_geometry) AS pos,
    dense_rank() OVER( PARTITION BY od_reach_point.fs_wastewater_networkelement ORDER BY st_line_locate_point(st_linemerge(od_reach.progression), od_reach_point.situation_geometry) ) as rank
  FROM qgep.od_reach_point
  LEFT JOIN qgep.od_reach ON od_reach_point.fs_wastewater_networkelement::text = od_reach.obj_id::text
  WHERE 
    od_reach_point.fs_wastewater_networkelement IS NOT NULL 
    AND od_reach.progression IS NOT NULL
  ORDER BY od_reach_point.obj_id, st_line_locate_point(st_linemerge(od_reach.progression), od_reach_point.situation_geometry)
)

-- define all the fields for the resulting view
SELECT 
  row_number() OVER () AS gid, odr.obj_id, odr.fs_reach_point_from AS rp_from_obj_id, 
  str_from.obj_id AS str_from_obj_id, 
  odr.fs_reach_point_to AS rp_to_obj_id, 
  str_to.obj_id AS str_to_obj_id, 
  COALESCE(msr.progression, odr.progression) AS progression_geometry, 
  msr.nodes, 
  msr.positions,
  msr.ranks, 
  odr.depth, 
  odr.length_effective,
  CASE
    WHEN ch_from.obj_id IS NOT NULL THEN 'channel'::text
    WHEN mh_from.obj_id IS NOT NULL THEN 'manhole'::text
    WHEN re_from.obj_id IS NOT NULL THEN 'reach'::text
    WHEN sp_from.obj_id IS NOT NULL THEN 'special_structure'::text
    ELSE NULL::text
  END AS str_from_type,
  CASE
    WHEN ch_to.obj_id IS NOT NULL THEN 'channel'::text
    WHEN disch_to.obj_id IS NOT NULL THEN 'discharge_point'::text
    WHEN inf_to.obj_id IS NOT NULL THEN 'infiltration_installation'::text
    WHEN mh_to.obj_id IS NOT NULL THEN 'manhole'::text
    WHEN re_to.obj_id IS NOT NULL THEN 'reach'::text
    WHEN sp_to.obj_id IS NOT NULL THEN 'special_structure'::text
    ELSE NULL::text
  END AS str_to_type
  -- creates aggregated data based on the temporary table segments (see above)
  FROM ( 
    SELECT
      parts.reach_obj_id, 
      array_agg(parts.node) AS nodes, 
      array_agg(parts.pos) AS positions,
      array_agg(parts.rank) AS ranks,
      st_multi(
        st_collect(
          st_line_substring(
            parts.reach_progression, 
            parts.pos1,
            parts.pos2
          )
        )
      ) AS progression
    FROM (
      SELECT 
        COALESCE(s1.reach_progression, s2.reach_progression) as reach_progression,
        COALESCE(s1.pos, 0::double precision) as pos1,
        COALESCE(s2.pos, 1::double precision) as pos2,
        s1.obj_id as node,
        s1.pos as pos,
        s1.rank as rank,
        COALESCE(s1.fs_wastewater_networkelement, s2.fs_wastewater_networkelement) AS reach_obj_id
        FROM segments s1
	FULL JOIN segments s2 
	  ON s1.gid = (s2.gid - 1) 
	  AND s1.fs_wastewater_networkelement = s2.fs_wastewater_networkelement
	ORDER BY COALESCE(s1.fs_wastewater_networkelement, s2.fs_wastewater_networkelement), s1.gid NULLS FIRST
    ) AS parts
    GROUP BY parts.reach_obj_id
  ) msr -- multi segment reach
  -- join any reach not yet included here
  RIGHT JOIN qgep.od_reach odr ON odr.obj_id::text = msr.reach_obj_id::text
  -- join other tables with additional info
  LEFT JOIN qgep.od_reach_point rp_from ON odr.fs_reach_point_from::text = rp_from.obj_id::text
  LEFT JOIN qgep.od_wastewater_networkelement ne_from ON rp_from.fs_wastewater_networkelement::text = ne_from.obj_id::text
  LEFT JOIN qgep.od_wastewater_structure str_from ON ne_from.fs_wastewater_structure::text = str_from.obj_id::text
  LEFT JOIN qgep.od_manhole mh_from ON mh_from.obj_id::text = str_from.obj_id::text
  LEFT JOIN qgep.od_special_structure sp_from ON sp_from.obj_id::text = str_from.obj_id::text
  LEFT JOIN qgep.od_reach re_from ON re_from.obj_id::text = str_from.obj_id::text
  LEFT JOIN qgep.od_channel ch_from ON ch_from.obj_id::text = str_from.obj_id::text
  LEFT JOIN qgep.od_reach_point rp_to ON odr.fs_reach_point_to::text = rp_to.obj_id::text
  LEFT JOIN qgep.od_wastewater_networkelement ne_to ON rp_to.fs_wastewater_networkelement::text = ne_to.obj_id::text
  LEFT JOIN qgep.od_wastewater_structure str_to ON ne_to.fs_wastewater_structure::text = str_to.obj_id::text
  LEFT JOIN qgep.od_manhole mh_to ON mh_to.obj_id::text = str_to.obj_id::text
  LEFT JOIN qgep.od_special_structure sp_to ON sp_to.obj_id::text = str_to.obj_id::text
  LEFT JOIN qgep.od_reach re_to ON re_to.obj_id::text = str_to.obj_id::text
  LEFT JOIN qgep.od_channel ch_to ON ch_to.obj_id::text = str_to.obj_id::text
  LEFT JOIN qgep.od_infiltration_installation inf_to ON inf_to.obj_id::text = str_to.obj_id::text
  LEFT JOIN qgep.od_discharge_point disch_to ON disch_to.obj_id::text = str_to.obj_id::text;
