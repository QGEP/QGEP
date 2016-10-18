UPDATE qgep.od_wastewater_structure ws
SET fk_main_cover = co.obj_id
FROM qgep.od_cover co
LEFT JOIN qgep.od_structure_part sp ON sp.obj_id = co.obj_id
WHERE sp.fk_wastewater_structure = ws.obj_id
