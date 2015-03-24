BEGIN TRANSACTION;

-- DROP VIEW qgep.vw_wizard_cover_special_structure ;

CREATE OR REPLACE VIEW qgep.vw_wizard_cover_special_structure AS 
 SELECT co.obj_id,
    co.brand,
    co.cover_shape,
    co.diameter,
    co.fastening,
    co.level,
    co.material AS cover_material,
    co.positional_accuracy,
    co.situation_geometry,
    co.sludge_bucket,
    co.venting,
    co.identifier,
    co.remark,
    co.renovation_demand,
    co.dataowner,
    co.provider,
    ss.obj_id AS special_structure_obj_id,
    ss.bypass,
    ss.depth,
    ss.emergency_spillway,
    ss.function,
    ss.stormwater_tank_arrangement,
    ss.upper_elevation,
    ss.accessibility,
    ss.contract_section,
    ss.detail_geometry_geometry,
    ss.detail_geometry_3d_geometry,
    ss.financing,
    ss.gross_costs,
    ss.inspection_interval,
    ss.location_name,
    ss.records,
    ss.renovation_necessity,
    ss.replacement_value,
    ss.rv_base_year,
    ss.rv_construction_type,
    ss.status,
    ss.structure_condition,
    ss.subsidies,
    ss.year_of_construction,
    ss.year_of_replacement,
    ss.fk_owner,
    ss.fk_operator,
    wn.backflow_level,
    wn.bottom_level
   FROM qgep.vw_cover co
     LEFT JOIN qgep.vw_special_structure ss ON ss.obj_id::text = co.fk_wastewater_structure::text
     LEFT JOIN qgep.vw_wastewater_node wn ON wn.fk_wastewater_structure::text = ss.obj_id::text
  WHERE false;

-- INSERT function

CREATE OR REPLACE FUNCTION qgep.vw_wizard_cover_special_structure_INSERT()
  RETURNS trigger AS
$BODY$
DECLARE
  ss_obj_id character varying(16);
BEGIN
  INSERT INTO qgep.vw_special_structure(
         bypass,
         depth,
         emergency_spillway,
         function,
         stormwater_tank_arrangement,
         upper_elevation,
         accessibility,
         contract_section,
         -- detail_geometry_3d_geometry,
         financing,
         gross_costs,
         identifier,
         inspection_interval,
         location_name,
         records,
         remark,
         renovation_necessity,
         replacement_value,
         rv_base_year,
         rv_construction_type,
         status,
         structure_condition,
         subsidies,
         year_of_construction,
         year_of_replacement,
         last_modification,
         dataowner,
         provider,
         fk_owner,
         fk_operator
       )
       VALUES
       (
         NEW.bypass,
         NEW.depth,
         NEW.emergency_spillway,
         NEW.function,
         NEW.stormwater_tank_arrangement,
         NEW.upper_elevation,
         NEW.accessibility,
         NEW.contract_section,
         -- NEW.detail_geometry_3d_geometry,
         NEW.financing,
         NEW.gross_costs,
         NEW.identifier,
         NEW.inspection_interval,
         NEW.location_name,
         NEW.records,
         NEW.remark,
         NEW.renovation_necessity,
         NEW.replacement_value,
         NEW.rv_base_year,
         NEW.rv_construction_type,
         NEW.status,
         NEW.structure_condition,
         NEW.subsidies,
         NEW.year_of_construction,
         NEW.year_of_replacement,
         now(),
         NEW.dataowner,
         NEW.provider,
         NEW.fk_owner,
         NEW.fk_operator
       ) RETURNING obj_id INTO ss_obj_id;

  INSERT INTO qgep.vw_wastewater_node(
      backflow_level
    , bottom_level
    , situation_geometry
    , identifier
    , remark
    , last_modification
    , dataowner
    , provider
    , fk_wastewater_structure
  )
  VALUES
  (
      NEW.backflow_level
    , NEW.bottom_level
    , NEW.situation_geometry
    , NEW.identifier
    , NEW.remark
    , now()
    , NEW.dataowner
    , NEW.provider
    , ss_obj_id
  );

  INSERT INTO qgep.vw_cover(
      brand
    , cover_shape
    , diameter
    , fastening
    , level
    , material
    , positional_accuracy
    , situation_geometry
    , sludge_bucket
    , venting
    , identifier
    , remark
    , renovation_demand
    , last_modification
    , dataowner
    , provider
    , fk_wastewater_structure
  )
  VALUES
  (
      NEW.brand
    , NEW.cover_shape
    , NEW.diameter
    , NEW.fastening
    , NEW.level
    , NEW.cover_material
    , NEW.positional_accuracy
    , NEW.situation_geometry
    , NEW.sludge_bucket
    , NEW.venting
    , NEW.identifier
    , NEW.remark
    , NEW.renovation_demand
    , now()
    , NEW.dataowner
    , NEW.provider
    , ss_obj_id
  );
  RETURN NEW;
END; $BODY$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS vw_wizard_cover_special_structure_ON_INSERT ON qgep.vw_wizard_cover_special_structure;

CREATE TRIGGER vw_wizard_cover_special_structure_ON_INSERT INSTEAD OF INSERT ON qgep.vw_wizard_cover_special_structure
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_wizard_cover_special_structure_INSERT();

END TRANSACTION;