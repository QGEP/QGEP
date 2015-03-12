-- View: vw_wizard_cover_manhole

BEGIN TRANSACTION;

-- DROP VIEW qgep.vw_wizard_cover_manhole;

CREATE OR REPLACE VIEW qgep.vw_wizard_cover_manhole AS 
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
    co.last_modification,
    co.dataowner,
    co.provider,
    mh.obj_id AS manhole_obj_id,
    mh.dimension1,
    mh.dimension2,
    mh.depth,
    mh.function,
    mh.material,
    mh.surface_inflow,
    mh.accessibility,
    mh.contract_section,
    mh.financing,
    mh.gross_costs,
    mh.inspection_interval,
    mh.location_name,
    mh.records,
    mh.renovation_necessity,
    mh.replacement_value,
    mh.rv_base_year,
    mh.rv_construction_type,
    mh.status,
    mh.structure_condition,
    mh.subsidies,
    mh.year_of_construction,
    mh.year_of_replacement,
    mh.fk_owner,
    mh.fk_operator,
    wn.backflow_level,
    wn.bottom_level
   FROM qgep.vw_cover co
     LEFT JOIN qgep.vw_manhole mh ON mh.obj_id::text = co.fk_wastewater_structure::text
     LEFT JOIN qgep.vw_wastewater_node wn ON wn.fk_wastewater_structure::text = mh.obj_id::text
  WHERE false;

ALTER TABLE qgep.vw_wizard_cover_manhole
  OWNER TO qgep;

-- INSERT function

CREATE OR REPLACE FUNCTION qgep.vw_wizard_cover_manhole_INSERT()
  RETURNS trigger AS
$BODY$
DECLARE
  mh_obj_id character varying(16);
BEGIN
  INSERT INTO qgep.vw_manhole(
         dimension1
       , dimension2
       , depth
       , function
       , material
       , surface_inflow
       , accessibility
       , contract_section
--       , detail_geometry_geometry
--       , detail_geometry_3d_geometry
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
         NEW.dimension1
       , NEW.dimension2
       , NEW.depth
       , NEW.function
       , NEW.material
       , NEW.surface_inflow
       , NEW.accessibility
       , NEW.contract_section
--       , NEW.detail_geometry_geometry
--       , NEW.detail_geometry_3d_geometry
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
       ) RETURNING obj_id INTO mh_obj_id;

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
    , NEW.last_modification
    , NEW.dataowner
    , NEW.provider
    , mh_obj_id
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
    , NEW.last_modification
    , NEW.dataowner
    , NEW.provider
    , mh_obj_id
  );
  RETURN NEW;
END; $BODY$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS vw_wizard_cover_manhole_ON_INSERT ON qgep.vw_wizard_cover_manhole;

CREATE TRIGGER vw_wizard_cover_manhole_ON_INSERT INSTEAD OF INSERT ON qgep.vw_wizard_cover_manhole
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_wizard_cover_manhole_INSERT();

END TRANSACTION;
