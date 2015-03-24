-- View: vw_wizard_reach_channel

-- DROP VIEW vw_wizard_reach_channel;

CREATE OR REPLACE VIEW qgep.vw_wizard_reach_channel AS 
 SELECT 
     re.obj_id
   , bedding_encasement
   , connection_type
   , ch.function_hierarchic
   , function_hydraulic
   , jetting_interval
   , pipe_length
   , ch.usage_current
   , usage_planned
   , accessibility
   , contract_section
   , financing
   , gross_costs
   , ch.identifier
   , inspection_interval
   , location_name
   , records
   , ch.remark
   , renovation_necessity
   , replacement_value
   , rv_base_year
   , rv_construction_type
   , status
   , structure_condition
   , subsidies
   , year_of_construction
   , year_of_replacement
   , ch.last_modification
   , ch.dataowner
   , ch.provider
   , fk_owner
   , fk_operator
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
   , fk_pipe_profile
   , fk_wastewater_structure
   , rp_from_obj_id
   , rp_from_elevation_accuracy
   , rp_from_identifier
   , rp_from_level
   , rp_from_outlet_shape
   , rp_from_position_of_connection
   , rp_from_remark
   , rp_from_last_modification
   , rp_from_dataowner
   , rp_from_provider
   , rp_from_fk_wastewater_networkelement
   , rp_to_obj_id
   , rp_to_elevation_accuracy
   , rp_to_identifier
   , rp_to_level
   , rp_to_outlet_shape
   , rp_to_position_of_connection
   , rp_to_remark
   , rp_to_last_modification
   , rp_to_dataowner
   , rp_to_provider
   , rp_to_fk_wastewater_networkelement
   
   FROM qgep.vw_channel ch
     LEFT JOIN qgep.vw_reach re ON ch.obj_id = re.fk_wastewater_structure
  WHERE false;

-- INSERT function

CREATE OR REPLACE FUNCTION qgep.vw_wizard_reach_channel_INSERT()
  RETURNS trigger AS
$BODY$
DECLARE
  ch_obj_id character varying(16);
BEGIN
  INSERT INTO qgep.vw_channel(
         bedding_encasement
       , connection_type
       , function_hierarchic
       , function_hydraulic
       , jetting_interval
       , pipe_length
       , usage_current
       , usage_planned
       , accessibility
       , contract_section
       , financing
       , gross_costs
       , identifier
       , inspection_interval
       , location_name
       , records
       , remark
       , renovation_necessity
       , replacement_value
       , rv_base_year
       , rv_construction_type
       , status
       , structure_condition
       , subsidies
       , year_of_construction
       , year_of_replacement
       , last_modification
       , dataowner
       , provider
       , fk_owner
       , fk_operator
       )
       VALUES
       (
         NEW.bedding_encasement
       , NEW.connection_type
       , NEW.function_hierarchic
       , NEW.function_hydraulic
       , NEW.jetting_interval
       , NEW.pipe_length
       , NEW.usage_current
       , NEW.usage_planned
       , NEW.accessibility
       , NEW.contract_section
       , NEW.financing
       , NEW.gross_costs
       , NEW.identifier
       , NEW.inspection_interval
       , NEW.location_name
       , NEW.records
       , NEW.remark
       , NEW.renovation_necessity
       , NEW.replacement_value
       , NEW.rv_base_year
       , NEW.rv_construction_type
       , NEW.status
       , NEW.structure_condition
       , NEW.subsidies
       , NEW.year_of_construction
       , NEW.year_of_replacement
       , NEW.last_modification
       , NEW.dataowner
       , NEW.provider
       , NEW.fk_owner
       , NEW.fk_operator
       ) RETURNING obj_id INTO ch_obj_id;

  INSERT INTO qgep.vw_reach(
     clear_height
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
   , fk_pipe_profile
   , fk_wastewater_structure
   , rp_from_elevation_accuracy
   , rp_from_identifier
   , rp_from_level
   , rp_from_outlet_shape
   , rp_from_position_of_connection
   , rp_from_remark
   , rp_from_last_modification
   , rp_from_dataowner
   , rp_from_provider
   , rp_from_fk_wastewater_networkelement
   , rp_to_elevation_accuracy
   , rp_to_identifier
   , rp_to_level
   , rp_to_outlet_shape
   , rp_to_position_of_connection
   , rp_to_remark
   , rp_to_last_modification
   , rp_to_dataowner
   , rp_to_provider
   , rp_to_fk_wastewater_networkelement
  )
  VALUES
  (
     NEW.clear_height
   , NEW.coefficient_of_friction
   , NEW.elevation_determination
   , NEW.horizontal_positioning
   , NEW.inside_coating
   , CASE WHEN NEW.length_effective IS NULL THEN round(ST_Length(NEW.progression_geometry)::numeric,2) ELSE NEW.length_effective END
   , NEW.material
   , NEW.progression_geometry
   , NEW.reliner_material
   , NEW.reliner_nominal_size
   , NEW.relining_construction
   , NEW.relining_kind
   , NEW.ring_stiffness
   , NEW.slope_building_plan
   , NEW.wall_roughness
   , NEW.fk_pipe_profile
   , ch_obj_id
   , NEW.rp_from_elevation_accuracy
   , NEW.rp_from_identifier
   , NEW.rp_from_level
   , NEW.rp_from_outlet_shape
   , NEW.rp_from_position_of_connection
   , NEW.rp_from_remark
   , NEW.rp_from_last_modification
   , NEW.rp_from_dataowner
   , NEW.rp_from_provider
   , NEW.rp_from_fk_wastewater_networkelement
   , NEW.rp_to_elevation_accuracy
   , NEW.rp_to_identifier
   , NEW.rp_to_level
   , NEW.rp_to_outlet_shape
   , NEW.rp_to_position_of_connection
   , NEW.rp_to_remark
   , NEW.rp_to_last_modification
   , NEW.rp_to_dataowner
   , NEW.rp_to_provider
   , NEW.rp_to_fk_wastewater_networkelement
  );
  RETURN NEW;
END; $BODY$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS vw_wizard_reach_channel_ON_INSERT ON qgep.vw_wizard_reach_channel;

CREATE TRIGGER vw_wizard_reach_channel_ON_INSERT INSTEAD OF INSERT ON qgep.vw_wizard_reach_channel
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_wizard_reach_channel_INSERT();

