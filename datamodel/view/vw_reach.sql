CREATE OR REPLACE VIEW qgep.vw_reach AS

SELECT
RE.obj_id
, RE.clear_height
, RE.coefficient_of_friction
, RE.elevation_determination
, RE.horizontal_positioning
, RE.inside_coating
, RE.length_effective
, RE.material
, RE.progression_geometry
, RE.progression_3d_geometry
, RE.reliner_material
, RE.reliner_nominal_size
, RE.relining_construction
, RE.relining_kind
, RE.ring_stiffness
, RE.slope_building_plan
, RE.wall_roughness
, RE.fk_pipe_profile

, NE.identifier
, NE.remark
, NE.last_modification
, NE.dataowner
, NE.provider
, NE.fk_wastewater_structure

, RP_FROM.obj_id AS rp_from_obj_id
, RP_FROM.elevation_accuracy AS rp_from_elevation_accuracy
, RP_FROM.identifier AS rp_from_identifier
, RP_FROM.level AS rp_from_level
, RP_FROM.outlet_shape AS rp_from_outlet_shape
, RP_FROM.position_of_connection AS rp_from_position_of_connection
, RP_FROM.remark AS rp_from_remark 
, RP_FROM.last_modification AS rp_from_last_modification
, RP_FROM.dataowner AS rp_from_dataowner
, RP_FROM.provider AS rp_from_provider
, RP_FROM.fk_wastewater_networkelement AS rp_from_fk_wastewater_networkelement

, RP_TO.obj_id AS rp_to_obj_id
, RP_TO.elevation_accuracy AS rp_to_elevation_accuracy
, RP_TO.identifier AS rp_to_identifier
, RP_TO.level AS rp_to_level
, RP_TO.outlet_shape AS rp_to_outlet_shape
, RP_TO.position_of_connection AS rp_to_position_of_connection
, RP_TO.remark AS rp_to_remark 
, RP_TO.last_modification AS rp_to_last_modification
, RP_TO.dataowner AS rp_to_dataowner
, RP_TO.provider AS rp_to_provider
, RP_TO.fk_wastewater_networkelement AS rp_to_fk_wastewater_networkelement

 FROM qgep.od_reach RE
LEFT JOIN qgep.od_wastewater_networkelement NE
  ON NE.obj_id = RE.obj_id
LEFT JOIN qgep.od_reach_point RP_FROM
  ON RP_FROM.obj_id = RE.fk_reach_point_from
LEFT JOIN qgep.od_reach_point RP_TO
  ON RP_TO.obj_id = RE.fk_reach_point_to

-- REACH INSERT
-- Function: vw_reach_insert()

CREATE OR REPLACE FUNCTION qgep.vw_reach_insert()
  RETURNS trigger AS
$BODY$
DECLARE
  rp_from_obj_id character varying(16);
  rp_to_obj_id character varying(16);
  ne_obj_id character varying(16);
BEGIN
  INSERT INTO qgep.od_reach_point(
            obj_id
            , elevation_accuracy
            , identifier
            , level
            , outlet_shape
            , position_of_connection
            , remark
            , situation_geometry
            , last_modification
            , dataowner
            , provider
            , fk_wastewater_networkelement
          )
    VALUES (
            qgep.generate_oid('od_reach_point') -- obj_id
            , NEW.rp_from_elevation_accuracy -- elevation_accuracy
            , NEW.rp_from_identifier -- identifier
            , NEW.rp_from_level -- level
            , NEW.rp_from_outlet_shape -- outlet_shape
            , NEW.rp_from_position_of_connection -- position_of_connection
            , NEW.rp_from_remark -- remark
            , ST_StartPoint( NEW.progression_geometry ) -- situation_geometry
            , NEW.rp_from_last_modification -- last_modification
            , NEW.rp_from_dataowner -- dataowner
            , NEW.rp_from_provider -- provider
            , NEW.rp_from_fk_wastewater_networkelement -- fk_wastewater_networkelement
          )
    RETURNING obj_id INTO rp_from_obj_id;


    INSERT INTO qgep.od_reach_point(
            obj_id
            , elevation_accuracy
            , identifier
            , level
            , outlet_shape
            , position_of_connection
            , remark
            , situation_geometry
            , last_modification
            , dataowner
            , provider
            , fk_wastewater_networkelement
          )
    VALUES (
            qgep.generate_oid('od_reach_point') -- obj_id
            , NEW.rp_to_elevation_accuracy -- elevation_accuracy
            , NEW.rp_to_identifier -- identifier
            , NEW.rp_to_level -- level
            , NEW.rp_to_outlet_shape -- outlet_shape
            , NEW.rp_to_position_of_connection -- position_of_connection
            , NEW.rp_to_remark -- remark
            , ST_EndPoint( NEW.progression_geometry ) -- situation_geometry
            , NEW.rp_to_last_modification -- last_modification
            , NEW.rp_to_dataowner -- dataowner
            , NEW.rp_to_provider -- provider
            , NEW.rp_to_fk_wastewater_networkelement -- fk_wastewater_networkelement
          )
    RETURNING obj_id INTO rp_to_obj_id;
    
  INSERT INTO qgep.od_wastewater_networkelement (
            obj_id
            , identifier
            , remark
            , last_modification
            , dataowner
            , provider
            , fk_wastewater_structure )
    VALUES ( qgep.generate_oid('od_reach') -- obj_id
            , NEW.identifier -- identifier
            , NEW.remark -- remark
            , NEW.last_modification -- last_modification
            , NEW.dataowner -- dataowner
            , NEW.provider -- provider
            , NEW.fk_wastewater_structure -- fk_wastewater_structure
           )
           RETURNING obj_id INTO ne_obj_id;

  INSERT INTO qgep.od_reach (
            obj_id
            , clear_height
            , coefficient_of_friction
            , elevation_determination
            , horizontal_positioning
            , inside_coating
            , length_effective
            , material
            , progression_geometry
            , reliner_material
            , reliner_nominal_size
            , relining_construction
            , relining_kind
            , ring_stiffness
            , slope_building_plan
            , wall_roughness
            , fk_reach_point_from
            , fk_reach_point_to
            , fk_pipe_profile )
    VALUES( ne_obj_id -- obj_id
            , NEW.clear_height
            , NEW.coefficient_of_friction
            , NEW.elevation_determination
            , NEW.horizontal_positioning
            , NEW.inside_coating
            , NEW.length_effective
            , NEW.material
            , NEW.progression_geometry
            , NEW.reliner_material
            , NEW.reliner_nominal_size
            , NEW.relining_construction
            , NEW.relining_kind
            , NEW.ring_stiffness
            , NEW.slope_building_plan
            , NEW.wall_roughness
            , rp_from_obj_id
            , rp_to_obj_id
            , NEW.fk_pipe_profile);
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION qgep.vw_reach_insert()
  OWNER TO qgep;

DROP TRIGGER vw_reach_ON_INSERT ON qgep.vw_reach;

CREATE TRIGGER vw_reach_ON_INSERT INSTEAD OF INSERT ON qgep.vw_reach
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_reach_INSERT();

-- REACH UPDATE
-- Rule: vw_reach_ON_UPDATE()

CREATE OR REPLACE RULE vw_reach_ON_UPDATE AS ON UPDATE TO qgep.vw_reach DO INSTEAD (
  UPDATE qgep.od_reach_point
    SET
        elevation_accuracy = NEW.rp_from_elevation_accuracy
      , identifier = NEW.rp_from_identifier
      , level = NEW.rp_from_level
      , outlet_shape = NEW.rp_from_outlet_shape
      , position_of_connection = NEW.rp_from_position_of_connection
      , remark = NEW.rp_from_remark
      , situation_geometry = ST_StartPoint( NEW.progression_geometry )
      , last_modification = NEW.rp_from_last_modification
      , dataowner = NEW.rp_from_dataowner
      , provider = NEW.rp_from_provider
      , fk_wastewater_networkelement = NEW.rp_from_fk_wastewater_networkelement
    WHERE obj_id = OLD.rp_from_obj_id;
    
  UPDATE qgep.od_reach_point
    SET
        elevation_accuracy = NEW.rp_to_elevation_accuracy
      , identifier = NEW.rp_to_identifier
      , level = NEW.rp_to_level
      , outlet_shape = NEW.rp_to_outlet_shape
      , position_of_connection = NEW.rp_to_position_of_connection
      , remark = NEW.rp_to_remark
      , situation_geometry = ST_EndPoint( NEW.progression_geometry )
      , last_modification = NEW.rp_to_last_modification
      , dataowner = NEW.rp_to_dataowner
      , provider = NEW.rp_to_provider
      , fk_wastewater_networkelement = NEW.rp_to_fk_wastewater_networkelement
    WHERE obj_id = OLD.rp_to_obj_id;

  UPDATE qgep.od_wastewater_networkelement
    SET
        identifier = NEW.identifier
      , remark = NEW.remark
      , last_modification = NEW.last_modification
      , dataowner = NEW.dataowner
      , provider = NEW.provider
      , fk_wastewater_structure = NEW.fk_wastewater_structure
    WHERE obj_id = OLD.obj_id;

  UPDATE qgep.od_reach
    SET clear_height = NEW.clear_height
      , coefficient_of_friction = NEW.coefficient_of_friction
      , elevation_determination = NEW.elevation_determination
      , horizontal_positioning = NEW.horizontal_positioning
      , inside_coating = NEW.inside_coating
      , length_effective = NEW.length_effective
      , material = NEW.material
      , progression_geometry = NEW.progression_geometry
      , reliner_material = NEW.reliner_material
      , reliner_nominal_size = NEW.reliner_nominal_size
      , relining_construction = NEW.relining_construction
      , relining_kind = NEW.relining_kind
      , ring_stiffness = NEW.ring_stiffness
      , slope_building_plan = NEW.slope_building_plan
      , wall_roughness = NEW.wall_roughness
      , fk_pipe_profile = NEW.fk_pipe_profile
    WHERE obj_id = OLD.obj_id;
);

-- REACH DELETE
-- Rule: vw_reach_ON_DELETE()

CREATE OR REPLACE RULE vw_reach_ON_DELETE AS ON DELETE TO qgep.vw_reach DO INSTEAD (
  DELETE FROM qgep.od_reach WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_wastewater_networkelement WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_reach_point WHERE obj_id = OLD.rp_from_obj_id;
  DELETE FROM qgep.od_reach_point WHERE obj_id = OLD.rp_to_obj_id;
);