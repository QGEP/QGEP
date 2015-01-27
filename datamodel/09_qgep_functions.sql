-- Function: qgep.create_manhole(geometry)

-- DROP FUNCTION qgep.create_manhole(geometry);

CREATE OR REPLACE FUNCTION qgep.create_manhole(geometry geometry)
  RETURNS text AS
$BODY$
-- Function to create a new manhole from a coordinate
--  geometries for od_cover and od_wastewater_node will be the same (Pickellochmodell)
--
-- Usage example: SELECT qgep.create_manhole(ST_GeometryFromText('POINT(696829.659 245169.69)',21781));
-- Returns: obj_id of od_cover element
DECLARE
  oid_wastewater_structure record;
  oid_structure_part record;
  oid_wastewater_networkelement record;
BEGIN
  --create wastewater_structure
  SELECT INTO oid_wastewater_structure qgep.generate_oid('od_wastewater_structure') AS obj_id;
  INSERT INTO qgep.od_wastewater_structure (obj_id, status, year_of_construction, last_modification) VALUES (oid_wastewater_structure.obj_id,3634,extract(year from now()),now());
  --create structure_part
  SELECT INTO oid_structure_part qgep.generate_oid('od_structure_part') AS obj_id;
  INSERT INTO qgep.od_structure_part (obj_id, last_modification, fk_wastewater_structure) VALUES (oid_structure_part.obj_id,now(),oid_wastewater_structure.obj_id);
  --create manhole
  INSERT INTO qgep.od_manhole (obj_id) VALUES (oid_wastewater_structure.obj_id);
  --create wastewater network element
  SELECT INTO oid_wastewater_networkelement qgep.generate_oid('od_wastewater_networkelement') AS obj_id;
  INSERT INTO qgep.od_wastewater_networkelement (obj_id, last_modification, fk_wastewater_structure) VALUES (oid_wastewater_networkelement.obj_id,now(),oid_wastewater_structure.obj_id);
  --create wastewater node
  INSERT INTO qgep.od_wastewater_node (obj_id, situation_geometry) VALUES (oid_wastewater_networkelement.obj_id, geometry);
  --create cover
  INSERT INTO qgep.od_cover (obj_id, situation_geometry) VALUES (oid_structure_part.obj_id, geometry);
  --return oid of waste-water structure object
  --this value is used to open the form of the od_wastewater_structure object
  RETURN oid_wastewater_structure.obj_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
