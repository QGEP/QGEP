-- View: vw_qgep_cover

BEGIN TRANSACTION;

DROP VIEW IF EXISTS qgep.vw_qgep_cover;

CREATE OR REPLACE VIEW qgep.vw_qgep_cover AS
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

    CASE
      WHEN mh.obj_id IS NOT NULL THEN 'manhole'
      WHEN ss.obj_id IS NOT NULL THEN 'special_structure'
      WHEN dp.obj_id IS NOT NULL THEN 'discharge_point'
      WHEN ii.obj_id IS NOT NULL THEN 'infiltration_installation'
      ELSE 'unknown'
    END AS ws_type,

    ws.obj_id as ws_obj_id,
    ws.accessibility,
    ws.contract_section,
    ws.financing,
    ws.gross_costs,
    ws.inspection_interval,
    ws.location_name,
    ws.records,
    ws.renovation_necessity,
    ws.replacement_value,
    ws.rv_base_year,
    ws.rv_construction_type,
    ws.status,
    ws.structure_condition,
    ws.subsidies,
    ws.year_of_construction,
    ws.year_of_replacement,
    ws.fk_owner,
    ws.fk_operator,

    COALESCE( mh.depth, ss.depth, dp.depth, ii.depth ) AS depth,
    COALESCE( mh.dimension1, ii.dimension1 ) AS dimension1,
    COALESCE( mh.dimension2, ii.dimension2 ) AS dimension2,
    COALESCE( ss.upper_elevation, dp.upper_elevation, ii.upper_elevation ) AS upper_elevation,

    mh.function AS manhole_function,
    mh.material,
    mh.surface_inflow,

    ws._usage_current AS channel_usage_current,
    ws._function_hierarchic AS channel_function_hierarchic,
    mh._orientation AS manhole_orientation,
    mh._label AS manhole_label,

    ss.bypass,
    ss.function as special_structure_function,
    ss.stormwater_tank_arrangement,

    dp.highwater_level,
    dp.relevance,
    dp.terrain_level,
    dp.waterlevel_hydraulic,

    ii.absorption_capacity,
    ii.defects,
    ii.distance_to_aquifer,
    ii.effective_area,
    ii.emergency_spillway,
    ii.kind,
    ii.labeling,
    ii.seepage_utilization,
    ii.vehicle_access,
    ii.watertightness,

    wn.obj_id AS wn_obj_id,
    wn.backflow_level,
    wn.bottom_level,
    -- wn.situation_geometry ,
    wn.identifier AS wn_identifier,
    wn.remark AS wn_remark,
    wn.last_modification AS wn_last_modification,
    wn.dataowner AS wn_dataowner,
    wn.provider AS wn_provider

   FROM qgep.vw_cover co
     LEFT JOIN qgep.od_wastewater_structure ws ON ws.obj_id = co.fk_wastewater_structure
     LEFT JOIN qgep.od_manhole mh ON mh.obj_id = co.fk_wastewater_structure
     LEFT JOIN qgep.od_special_structure ss ON ss.obj_id = co.fk_wastewater_structure
     LEFT JOIN qgep.od_discharge_point dp ON dp.obj_id = co.fk_wastewater_structure
     LEFT JOIN qgep.od_infiltration_installation ii ON ii.obj_id = co.fk_wastewater_structure

     LEFT JOIN qgep.vw_wastewater_node wn ON wn.fk_wastewater_structure = ws.obj_id;

-- INSERT function

CREATE OR REPLACE FUNCTION qgep.vw_qgep_cover_INSERT()
  RETURNS trigger AS
$BODY$
DECLARE
  ws_obj_id character varying(16);
BEGIN
  -- Manhole
  CASE
    WHEN NEW.ws_type = 'manhole' THEN
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
           , NEW.manhole_function
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
           ) RETURNING obj_id INTO ws_obj_id;

    -- Special Structure
    WHEN NEW.ws_type = 'special_structure' THEN
      INSERT INTO qgep.vw_special_structure(
             depth
           , emergency_spillway
           , function
           , stormwater_tank_arrangement
           , upper_elevation

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
             NEW.depth
           , NEW.emergency_spillway
           , NEW.special_structure_function
           , NEW.stormwater_tank_arrangement
           , NEW.upper_elevation


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
           ) RETURNING obj_id INTO ws_obj_id;

    -- Discharge Point
    WHEN NEW.ws_type = 'discharge_point' THEN
      INSERT INTO qgep.vw_discharge_point(
             depth
           , highwater_level
           , relevance
           , terrain_level
           , upper_elevation
           , waterlevel_hydraulic

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
             NEW.depth
           , NEW.highwater_level
           , NEW.relevance
           , NEW.terrain_level
           , NEW.upper_elevation
           , NEW.waterlevel_hydraulic

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
           ) RETURNING obj_id INTO ws_obj_id;

    -- Infiltration Installation
    WHEN NEW.ws_type = 'infiltration_installation' THEN
     RAISE NOTICE 'Wastewater structure type not known (%)', ws_type; -- ERROR
     -- TODO
    ELSE
     RAISE NOTICE 'Wastewater structure type not known (%)', ws_type; -- ERROR
  END CASE;

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
    , COALESCE(NULLIF(NEW.wn_identifier,''), NEW.identifier)
    , COALESCE(NULLIF(NEW.wn_remark,''), NEW.remark)
    , NOW()
    , COALESCE(NULLIF(NEW.wn_provider,''), NEW.provider) -- TODO will need to be switched to fk
    , COALESCE(NULLIF(NEW.wn_dataowner,''), NEW.dataowner) -- TODO will need to be switched to fk
    , ws_obj_id
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
    , NOW()
    , NEW.dataowner
    , NEW.provider
    , ws_obj_id
  );
  RETURN NEW;
END; $BODY$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS vw_qgep_cover_ON_INSERT ON qgep.vw_qgep_cover;

CREATE TRIGGER vw_qgep_cover_ON_INSERT INSTEAD OF INSERT ON qgep.vw_qgep_cover
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_qgep_cover_INSERT();

ALTER TABLE qgep.vw_qgep_cover OWNER TO qgep;

END TRANSACTION;
