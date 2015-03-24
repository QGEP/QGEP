CREATE OR REPLACE VIEW qgep.vw_access_aid AS

SELECT
  AA.obj_id
, AA.kind

, SP.identifier
, SP.remark
, SP.renovation_demand
, SP.last_modification
, SP.dataowner
, SP.provider
, SP.fk_wastewater_structure

  FROM qgep.od_access_aid AA
LEFT JOIN qgep.od_structure_part SP
  ON SP.obj_id = AA.obj_id;

-------------------------------------------------------
-- access_aid INSERT
-- Function: vw_access_aid_insert()
-------------------------------------------------------

CREATE OR REPLACE FUNCTION qgep.vw_access_aid_insert()
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
    VALUES ( qgep.generate_oid('od_access_aid') -- obj_id
            , NEW.identifier
            , NEW.remark
            , NEW.renovation_demand
            , NEW.last_modification
            , NEW.dataowner
            , NEW.provider
            , NEW.fk_wastewater_structure
           )
           RETURNING obj_id INTO NEW.obj_id;

  INSERT INTO qgep.od_access_aid(
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

-- DROP TRIGGER vw_access_aid_ON_INSERT ON qgep.vw_access_aid;

CREATE TRIGGER vw_access_aid_ON_INSERT INSTEAD OF INSERT ON qgep.vw_access_aid
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_access_aid_insert();

-------------------------------------------------------
-- access_aid UPDATE
-- Rule: vw_access_aid_ON_UPDATE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_access_aid_ON_UPDATE AS ON UPDATE TO qgep.vw_access_aid DO INSTEAD (
UPDATE qgep.od_access_aid
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
-- access_aid DELETE
-- Rule: vw_access_aid_ON_DELETE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_access_aid_ON_DELETE AS ON DELETE TO qgep.vw_access_aid DO INSTEAD (
  DELETE FROM qgep.od_access_aid WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_structure_part WHERE obj_id = OLD.obj_id;
);
