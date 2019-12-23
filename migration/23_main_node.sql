UPDATE qgep_od.wastewater_structure WS
SET fk_main_wastewater_node = structure_node.wn_obj_id
FROM (
  SELECT WS.obj_id AS obj_id, min(WN.obj_id) AS wn_obj_id
  FROM qgep_od.wastewater_structure WS
  LEFT JOIN qgep_od.wastewater_networkelement NE ON NE.fk_wastewater_structure = WS.obj_id
  LEFT JOIN qgep_od.wastewater_node WN ON NE.obj_id = WN.obj_id
  GROUP BY WS.obj_id
) AS structure_node
WHERE structure_node.obj_id = WS.obj_id;
