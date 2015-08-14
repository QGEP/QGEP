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
where a.obj_id = ws.obj_id
