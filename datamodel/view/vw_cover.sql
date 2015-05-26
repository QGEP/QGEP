BEGIN TRANSACTION;

CREATE OR REPLACE VIEW qgep.vw_cover AS
SELECT co.obj_id,
    co.brand,
    co.cover_shape,
    co.depth,
    co.diameter,
    co.fastening,
    co.level,
    co.material,
    co.positional_accuracy,
    co.situation_geometry,
    co.sludge_bucket,
    co.venting,
    sp.identifier,
    sp.remark,
    sp.renovation_demand,
    sp.last_modification,
    sp.dataowner,
    sp.provider,
    sp.fk_wastewater_structure
   FROM qgep.od_cover co
     LEFT JOIN qgep.od_structure_part sp ON sp.obj_id::text = co.obj_id::text;

-------------------------------------------------------
-- cover INSERT
-- Function: vw_cover_insert()
-------------------------------------------------------

CREATE OR REPLACE FUNCTION qgep.vw_cover_insert()
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
    VALUES ( qgep.generate_oid('od_cover') -- obj_id
            , NEW.identifier
            , NEW.remark
            , NEW.renovation_demand
            , NEW.last_modification
            , NEW.dataowner
            , NEW.provider
            , NEW.fk_wastewater_structure
           )
           RETURNING obj_id INTO NEW.obj_id;

  INSERT INTO qgep.od_cover(
                obj_id 
              , brand
              , cover_shape
              , depth
              , diameter
              , fastening
              , level
              , material
              , positional_accuracy
              , situation_geometry
              , sludge_bucket
              , venting
            )
            VALUES(
              NEW.obj_id -- obj_id
            , NEW.brand
            , NEW.cover_shape
            , NEW.depth
            , NEW.diameter
            , NEW.fastening
            , NEW.level
            , NEW.material
            , NEW.positional_accuracy
            , NEW.situation_geometry
            , NEW.sludge_bucket
            , NEW.venting
            );
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- DROP TRIGGER vw_cover_ON_INSERT ON qgep.vw_cover;

CREATE TRIGGER vw_cover_ON_INSERT INSTEAD OF INSERT ON qgep.vw_cover
  FOR EACH ROW EXECUTE PROCEDURE qgep.vw_cover_insert();

-------------------------------------------------------
-- cover UPDATE
-- Rule: vw_cover_ON_UPDATE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_cover_ON_UPDATE AS ON UPDATE TO qgep.vw_cover DO INSTEAD (
UPDATE qgep.od_cover
  SET
      brand=NEW.brand
    , cover_shape=NEW.cover_shape
    , depth=NEW.depth
    , diameter=NEW.diameter
    , fastening=NEW.fastening
    , level=NEW.level
    , material=NEW.material
    , positional_accuracy=NEW.positional_accuracy
    , situation_geometry=NEW.situation_geometry
    , sludge_bucket=NEW.sludge_bucket
    , venting=NEW.venting
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
-- cover DELETE
-- Rule: vw_cover_ON_DELETE()
-------------------------------------------------------

CREATE OR REPLACE RULE vw_cover_ON_DELETE AS ON DELETE TO qgep.vw_cover DO INSTEAD (
  DELETE FROM qgep.od_cover WHERE obj_id = OLD.obj_id;
  DELETE FROM qgep.od_structure_part WHERE obj_id = OLD.obj_id;
);

END TRANSACTION;
