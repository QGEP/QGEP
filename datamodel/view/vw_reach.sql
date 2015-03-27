CREATE OR REPLACE VIEW qgep.vw_reach AS

 SELECT re.obj_id,
    re.clear_height AS clear_height,
    CASE WHEN pp.height_width_ratio IS NOT NULL THEN round(re.clear_height::numeric * pp.height_width_ratio)::smallint ELSE clear_height END AS width,
    re.coefficient_of_friction,
    re.elevation_determination,
    re.horizontal_positioning,
    re.inside_coating,
    re.length_effective,
    CASE WHEN rp_from.level > 0 AND rp_to.level > 0 THEN round((rp_from.level - rp_to.level)/re.length_effective*1000,1) ELSE NULL END AS slope_per_mill,
    re.material,
    re.progression_geometry,
    re.progression_3d_geometry,
    re.reliner_material,
    re.reliner_nominal_size,
    re.relining_construction,
    re.relining_kind,
    re.ring_stiffness,
    re.slope_building_plan,
    re.wall_roughness,
    re.fk_pipe_profile,
    ch.usage_current AS usage_current,
    ch.function_hierarchic AS function_hierarchic,
    ne.identifier,
    ne.remark,
    ne.last_modification,
    ne.dataowner,
    ne.provider,
    ne.fk_wastewater_structure,
    rp_from.obj_id AS rp_from_obj_id,
    rp_from.elevation_accuracy AS rp_from_elevation_accuracy,
    rp_from.identifier AS rp_from_identifier,
    rp_from.level AS rp_from_level,
    rp_from.outlet_shape AS rp_from_outlet_shape,
    rp_from.position_of_connection AS rp_from_position_of_connection,
    rp_from.remark AS rp_from_remark,
    rp_from.last_modification AS rp_from_last_modification,
    rp_from.dataowner AS rp_from_dataowner,
    rp_from.provider AS rp_from_provider,
    rp_from.fk_wastewater_networkelement AS rp_from_fk_wastewater_networkelement,
    rp_to.obj_id AS rp_to_obj_id,
    rp_to.elevation_accuracy AS rp_to_elevation_accuracy,
    rp_to.identifier AS rp_to_identifier,
    rp_to.level AS rp_to_level,
    rp_to.outlet_shape AS rp_to_outlet_shape,
    rp_to.position_of_connection AS rp_to_position_of_connection,
    rp_to.remark AS rp_to_remark,
    rp_to.last_modification AS rp_to_last_modification,
    rp_to.dataowner AS rp_to_dataowner,
    rp_to.provider AS rp_to_provider,
    rp_to.fk_wastewater_networkelement AS rp_to_fk_wastewater_networkelement
   FROM qgep.od_reach re
     LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.obj_id = re.obj_id
     LEFT JOIN qgep.od_reach_point rp_from ON rp_from.obj_id = re.fk_reach_point_from
     LEFT JOIN qgep.od_reach_point rp_to ON rp_to.obj_id = re.fk_reach_point_to
     LEFT JOIN qgep.od_wastewater_structure str ON ne.fk_wastewater_structure = str.obj_id
     LEFT JOIN qgep.od_channel ch ON ch.obj_id = str.obj_id
     LEFT JOIN qgep.od_pipe_profile pp ON re.fk_pipe_profile = pp.obj_id
     LEFT JOIN qgep.vl_reach_material mat ON re.material = mat.code;

-- REACH INSERT
-- Function: vw_reach_insert()

CREATE OR REPLACE FUNCTION qgep.vw_reach_insert()
  RETURNS trigger AS
$BODY$
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
    RETURNING obj_id INTO NEW.rp_from_obj_id;


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
    RETURNING obj_id INTO NEW.rp_to_obj_id;
    
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
           RETURNING obj_id INTO NEW.obj_id;

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
    VALUES(
              NEW.obj_id -- obj_id
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
            , NEW.rp_from_obj_id
            , NEW.rp_to_obj_id
            , NEW.fk_pipe_profile);
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- DROP TRIGGER vw_reach_ON_INSERT ON qgep.vw_reach;

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
