CREATE OR REPLACE VIEW qgep.vw_discharge_point AS

SELECT
  DP.obj_id
, DP.depth
, DP.highwater_level
, DP.relevance
, DP.terrain_level
, DP.upper_elevation
, DP.waterlevel_hydraulic

, WS.accessibility
, WS.contract_section
, WS.detail_geometry_geometry
, WS.detail_geometry_3d_geometry
, WS.financing, gross_costs
, WS.identifier
, WS.inspection_interval
, WS.location_name
, WS.records
, WS.remark
, WS.renovation_necessity
, WS.replacement_value
, WS.rv_base_year
, WS.rv_construction_type
, WS.status
, WS.structure_condition
, WS.subsidies
, WS.year_of_construction
, WS.year_of_replacement
, WS.last_modification
, WS.dataowner
, WS.provider
, WS.fk_owner
, WS.fk_operator
  FROM qgep.od_discharge_point DP
LEFT JOIN qgep.od_wastewater_structure WS
  ON WS.obj_id = DP.obj_id;

-------------------------------------------------------
-- DISCHARGE POINT INSERT
-- Function: vw_discharge_point_insert()
-------------------------------------------------------

CREATE OR REPLACE FUNCTION qgep.vw_discharge_point_insert()
  RETURNS trigger AS
$BODY$
BEGIN
  INSERT INTO qgep.od_wastewater_structure (
            obj_id
            , accessibility
            , contract_section
            , detail_geometry_geometry
            , detail_geometry_3d_geometry
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
            , fk_operator )
    VALUES ( qgep.generate_oid('od_discharge_point') -- obj_id
            , NEW.accessibility
            , NEW.contract_section
            , NEW.detail_geometry_geometry
            , NEW.detail_geometry_3d_geometry
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
           )
           RETURNING obj_id INTO NEW.obj_id;

  INSERT INTO qgep.od_discharge_point(
              obj_id
            , depth
            , highwater_level
            , relevance
            , terrain_level
            , upper_elevation
            , waterlevel_hydraulic )
            VALUES (
            NEW.obj_id
            , NEW.depth
            , NEW.highwater_level
            , NEW.relevance
            , NEW.terrain_level
            , NEW.upper_elevation
            , NEW.waterlevel_hydraulic
            );

  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- DROP TRIGGER vw_discharge_point_ON_INSERT ON qgep.vw_discharge_point;

CREATE TRIGGER vw_discharge_point_ON_INSERT INSTEAD OF INSERT ON qgep.vw_discharge_point
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_discharge_point_insert();

-------------------------------------------------------
-- DISCHARGE POINT UPDATE
-- Rule: vw_discharge_point_ON_UPDATE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_discharge_point_ON_UPDATE AS ON UPDATE TO qgep.vw_discharge_point DO INSTEAD (
  UPDATE qgep.od_discharge_point
  SET
    depth=NEW.depth
  , highwater_level=NEW.highwater_level
  , relevance=NEW.relevance
  , terrain_level=NEW.terrain_level
  , upper_elevation=NEW.upper_elevation
  , waterlevel_hydraulic=NEW.waterlevel_hydraulic
  WHERE obj_id = OLD.obj_id;

  UPDATE qgep.od_wastewater_structure
  SET
    accessibility=NEW.accessibility
  , contract_section=NEW.contract_section
  , detail_geometry_geometry=NEW.detail_geometry_geometry
  , detail_geometry_3d_geometry=NEW.detail_geometry_3d_geometry
  , financing=NEW.financing
  , gross_costs=NEW.gross_costs
  , identifier=NEW.identifier
  , inspection_interval=NEW.inspection_interval
  , location_name=NEW.location_name
  , records=NEW.records
  , remark=NEW.remark
  , renovation_necessity=NEW.renovation_necessity
  , replacement_value=NEW.replacement_value
  , rv_base_year=NEW.rv_base_year
  , rv_construction_type=NEW.rv_construction_type
  , status=NEW.status
  , structure_condition=NEW.structure_condition
  , subsidies=NEW.subsidies
  , year_of_construction=NEW.year_of_construction
  , year_of_replacement=NEW.year_of_replacement
  , last_modification=NEW.last_modification
  , dataowner=NEW.dataowner
  , provider=NEW.provider
  , fk_owner=NEW.fk_owner
  , fk_operator=NEW.fk_operator
  WHERE obj_id = OLD.obj_id;
);

-------------------------------------------------------
-- DISCHARGE POINT DELETE
-- Rule: vw_discharge_point_ON_DELETE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_discharge_point_ON_DELETE AS ON DELETE TO qgep.vw_discharge_point DO INSTEAD (
  DELETE FROM qgep.od_discharge_point WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_wastewater_structure WHERE obj_id = OLD.obj_id;
);
