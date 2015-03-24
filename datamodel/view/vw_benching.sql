CREATE OR REPLACE VIEW qgep.vw_benching AS

SELECT
  BE.obj_id
, BE.kind

, SP.identifier
, SP.remark
, SP.renovation_demand
, SP.last_modification
, SP.dataowner
, SP.provider
, SP.fk_wastewater_structure

  FROM qgep.od_benching BE
LEFT JOIN qgep.od_structure_part SP
  ON SP.obj_id = BE.obj_id;

-------------------------------------------------------
-- benching INSERT
-- Function: vw_benching_insert()
-------------------------------------------------------

CREATE OR REPLACE FUNCTION qgep.vw_benching_insert()
  RETURNS trigger AS
$BODY$
BEGIN
  INSERT INTO qgep.od_structure_part(
            obj_id
          , identifier
          , remark
          , renovation_demand
          , last_modification
          , dataowner
          , provider
          , fk_wastewater_structure
          )
    VALUES ( qgep.generate_oid('od_benching') -- obj_id
            , NEW.identifier
            , NEW.remark
            , NEW.renovation_demand
            , NEW.last_modification
            , NEW.dataowner
            , NEW.provider
            , NEW.fk_wastewater_structure
           )
           RETURNING obj_id INTO NEW.obj_id;

  INSERT INTO qgep.od_benching(
                obj_id
              , kind
            )
            VALUES(
              NEW.obj_id -- obj_id
            , NEW.kind
            );
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- DROP TRIGGER vw_benching_ON_INSERT ON qgep.vw_benching;

CREATE TRIGGER vw_benching_ON_INSERT INSTEAD OF INSERT ON qgep.vw_benching
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_benching_insert();

-------------------------------------------------------
-- benching UPDATE
-- Rule: vw_benching_ON_UPDATE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_benching_ON_UPDATE AS ON UPDATE TO qgep.vw_benching DO INSTEAD (
UPDATE qgep.od_benching
  SET
    kind=NEW.kind
  WHERE obj_id = OLD.obj_id;

UPDATE qgep.od_structure_part
  SET
    identifier=NEW.identifier
  , remark=NEW.remark
  , renovation_demand=NEW.renovation_demand
  , last_modification=NEW.last_modification
  , dataowner=NEW.dataowner
  , provider=NEW.provider
  , fk_wastewater_structure=NEW.fk_wastewater_structure
  WHERE obj_id = OLD.obj_id;
);

-------------------------------------------------------
-- benching DELETE
-- Rule: vw_benching_ON_DELETE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_benching_ON_DELETE AS ON DELETE TO qgep.vw_benching DO INSTEAD (
  DELETE FROM qgep.od_benching WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_structure_part WHERE obj_id = OLD.obj_id;
);
