WITH reach_hierarchy_usage AS (
SELECT function_hierarchic, order_fct_hierarchic, usage_current, order_usage_current, fk_reach_point_from, fk_reach_point_to
  FROM qgep.od_reach re
  LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.obj_id = re.obj_id
  LEFT JOIN qgep.od_channel CH ON CH.obj_id = ne.fk_wastewater_structure
  LEFT JOIN qgep.vl_channel_function_hierarchic vl_fct_hier ON CH.function_hierarchic = vl_fct_hier.code
  LEFT JOIN qgep.vl_channel_usage_current vl_usg_curr ON CH.usage_current = vl_usg_curr.code
  WHERE CH.function_hierarchic IS NOT NULL
)

UPDATE qgep.od_wastewater_structure AS ws
SET
  _function_hierarchic = COALESCE(function_hierarchic_from, function_hierarchic_to),
  _usage_current = COALESCE(usage_current_from, usage_current_to)
 FROM(
  SELECT ws.obj_id,
    rh_from.function_hierarchic AS function_hierarchic_from,
    rh_to.function_hierarchic AS function_hierarchic_to,
    rh_from.usage_current AS usage_current_from,
    rh_to.usage_current AS usage_current_to,
    rank() OVER( PARTITION BY ws.obj_id ORDER BY rh_from.order_fct_hierarchic ASC NULLS LAST, rh_to.order_fct_hierarchic ASC NULLS LAST, rh_from.order_usage_current ASC NULLS LAST, rh_to.order_usage_current ASC NULLS LAST) AS hierarchy_rank
  FROM
    qgep.od_wastewater_structure ws
    LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.fk_wastewater_structure = ws.obj_id
 
    LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement

    LEFT JOIN reach_hierarchy_usage  rh_from ON rh_from.fk_reach_point_from = rp.obj_id
    LEFT JOIN reach_hierarchy_usage  rh_to ON rh_to.fk_reach_point_to = rp.obj_id
) a
where a.obj_id = ws.obj_id;

-----------------------------------------------
-- Labels
-----------------------------------------------

UPDATE qgep.od_wastewater_structure
SET _label = label
FROM (
  SELECT ws_obj_id,
       array_to_string(
         array_agg( 'C' || '=' || co_level::text ORDER BY co_level DESC),
         E'\n'
       ) ||
       E'\n' ||
       ws_identifier || 
       E'\n' ||
       array_to_string(
         array_agg(
           io || 
             CASE 
               WHEN io='I' THEN i_index 
               ELSE o_index 
             END  || '⁼' || 
             COALESCE(round(level, 2)::text, 'N/A')
           ORDER BY io='O' ASC NULLS LAST, CASE WHEN io = 'I' THEN i_index ELSE o_index END)
           , E'\n'
         ) AS label
  FROM (
    SELECT SP.identifier AS co_identifier,
           CO.obj_id,
           CO.level AS co_level,
           WS.obj_id AS ws_obj_id,
           WS.identifier AS ws_identifier,
           RP.obj_id,
           RP.level,
           RE_from.obj_id,
           RE_to.obj_id,
           CASE 
             WHEN RE_to.obj_id IS NOT NULL THEN 'I' 
             WHEN RE_from.obj_id IS NOT NULL THEN 'O'
             ELSE NULL 
           END AS io,
           row_number() OVER(
             PARTITION BY WS.obj_id
             ORDER BY ST_Azimuth(RP.situation_geometry,ST_LineInterpolatePoint(ST_GeometryN(RE_to.progression_geometry,1),0.99))/pi()*180 ASC) AS i_index,
           row_number() OVER(
             PARTITION BY WS.obj_id
             ORDER BY ST_Azimuth(RP.situation_geometry,ST_LineInterpolatePoint(ST_GeometryN(RE_from.progression_geometry,1),0.99))/pi()*180 ASC) AS o_index
    FROM qgep.od_wastewater_structure WS
    INNER JOIN qgep.od_wastewater_networkelement NE ON NE.fk_wastewater_structure = WS.obj_id
    INNER JOIN qgep.od_reach_point RP ON RP.fk_wastewater_networkelement = NE.obj_id
    LEFT JOIN qgep.od_reach RE_from ON RP.obj_id = RE_from.fk_reach_point_from
    LEFT JOIN qgep.od_reach RE_to ON RP.obj_id = RE_to.fk_reach_point_to
    RIGHT OUTER JOIN qgep.od_structure_part SP on SP.fk_wastewater_structure = WS.obj_id
    RIGHT JOIN qgep.od_cover CO ON CO.obj_id = SP.obj_id
  ) AS c
  GROUP BY ws_identifier, ws_obj_id
) sq
WHERE ws_obj_id = obj_id;