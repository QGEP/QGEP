CREATE OR REPLACE VIEW qgep.vw_wastewater_node AS

SELECT
WN.obj_id
, WN.backflow_level
, WN.bottom_level
, WN.situation_geometry

, NE.identifier
, NE.remark
, NE.last_modification
, NE.dataowner
, NE.provider
, NE.fk_wastewater_structure

 FROM qgep.od_wastewater_node WN
LEFT JOIN qgep.od_wastewater_networkelement NE
  ON NE.obj_id = WN.obj_id;

-- wastewater_node INSERT
-- Function: vw_wastewater_node_insert()

CREATE OR REPLACE FUNCTION qgep.vw_wastewater_node_insert()
  RETURNS trigger AS
$BODY$
DECLARE
  ne_obj_id character varying(16);
BEGIN

  INSERT INTO qgep.od_wastewater_networkelement (
            obj_id
            , identifier
            , remark
            , last_modification
            , dataowner
            , provider
            , fk_wastewater_structure )
    VALUES ( qgep.generate_oid('od_wastewater_node') -- obj_id
            , NEW.identifier -- identifier
            , NEW.remark -- remark
            , NEW.last_modification -- last_modification
            , NEW.dataowner -- dataowner
            , NEW.provider -- provider
            , NEW.fk_wastewater_structure -- fk_wastewater_structure
           )
           RETURNING obj_id INTO ne_obj_id;

  INSERT INTO qgep.od_wastewater_node (
            obj_id
          , backflow_level
          , bottom_level
          , situation_geometry
          )
    VALUES( ne_obj_id -- obj_id
          , NEW.backflow_level
          , NEW.bottom_level
          , NEW.situation_geometry
          );
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- DROP TRIGGER vw_wastewater_node_ON_INSERT ON qgep.vw_wastewater_node;

CREATE TRIGGER vw_wastewater_node_ON_INSERT INSTEAD OF INSERT ON qgep.vw_wastewater_node
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_wastewater_node_INSERT();

-- wastewater_node UPDATE
-- Rule: vw_wastewater_node_ON_UPDATE()

CREATE OR REPLACE RULE vw_wastewater_node_ON_UPDATE AS ON UPDATE TO qgep.vw_wastewater_node DO INSTEAD (
  UPDATE qgep.od_wastewater_networkelement
    SET
        identifier = NEW.identifier
      , remark = NEW.remark
      , last_modification = NEW.last_modification
      , dataowner = NEW.dataowner
      , provider = NEW.provider
      , fk_wastewater_structure = NEW.fk_wastewater_structure
    WHERE obj_id = OLD.obj_id;

  UPDATE qgep.od_wastewater_node
    SET backflow_level=NEW.backflow_level
      , bottom_level=NEW.bottom_level
      , situation_geometry=NEW.situation_geometry
    WHERE obj_id = OLD.obj_id;
);

-- wastewater_node DELETE
-- Rule: vw_wastewater_node_ON_DELETE()

CREATE OR REPLACE RULE vw_wastewater_node_ON_DELETE AS ON DELETE TO qgep.vw_wastewater_node DO INSTEAD (
  DELETE FROM qgep.od_wastewater_node WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_wastewater_networkelement WHERE obj_id = OLD.obj_id;
);