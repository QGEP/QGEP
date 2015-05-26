-- Function: qgep.wastewater_structure_symbology_attribs(text)
-- This function allows to determine the function_hierarchic and usage_current of a given wastewater_structure
-- in order to properly style the wastewater_structure.
-- Determination of these attributes is based on the outgoing reaches (ordered by hierarchy) - if any - or incoming reaches
-- if there are no outgoing reaches

-- DROP FUNCTION qgep.wastewater_structure_symbology_attribs(text);

-- NEW return type necessary for the function below
CREATE TYPE qgep.wastewater_structure_symbology_attribs AS
   (function_hierarchic smallint,
    usage_current smallint);

CREATE OR REPLACE FUNCTION qgep.wastewater_structure_symbology_attribs(wastewater_structure_object_id text)
  RETURNS qgep.wastewater_structure_symbology_attribs AS
$BODY$DECLARE
myrec record;
return_vals qgep.wastewater_structure_symbology_attribs;
network_element_obj_id character varying(16);
order_fct_hierarchic smallint := 99;
order_usage_current smallint := 99;
function_hierarchic smallint := NULL;
usage_current smallint := NULL;
BEGIN
-- first get the relevant network_element obj_id
SELECT INTO myrec ne.obj_id
  FROM qgep.od_wastewater_structure ws
  LEFT JOIN qgep.od_wastewater_structure str ON ws.obj_id = str.obj_id
  LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.fk_wastewater_structure = str.obj_id
  WHERE ws.obj_id = wastewater_structure_object_id;
network_element_obj_id := myrec.obj_id;
-- process first only outgoing channels/reaches
-- need to process multiple outgoing reaches in order of function_hierarchic and usage_current
FOR myrec
  IN SELECT
    channel_from.function_hierarchic,
    vl_fct_hier.order_fct_hierarchic,
    channel_from.usage_current,
    vl_usg_curr.order_usage_current
    FROM qgep.od_wastewater_networkelement ne
    LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement
    LEFT JOIN qgep.od_reach re_from ON re_from.fk_reach_point_from = rp.obj_id
    LEFT JOIN qgep.od_wastewater_networkelement ne_from ON ne_from.obj_id = re_from.obj_id
    LEFT JOIN qgep.od_wastewater_structure struct_from ON ne_from.fk_wastewater_structure = struct_from.obj_id
    LEFT JOIN qgep.od_channel channel_from ON channel_from.obj_id = struct_from.obj_id
    LEFT JOIN qgep.vl_channel_function_hierarchic vl_fct_hier ON channel_from.function_hierarchic = vl_fct_hier.code
    LEFT JOIN qgep.vl_channel_usage_current vl_usg_curr ON channel_from.usage_current = vl_usg_curr.code
    WHERE ne.obj_id = network_element_obj_id AND channel_from.function_hierarchic IS NOT NULL
    AND channel_from.usage_current IS NOT NULL
    ORDER BY vl_fct_hier.order_fct_hierarchic ASC, vl_usg_curr.order_usage_current ASC
LOOP
  IF myrec.order_fct_hierarchic IS NOT NULL AND myrec.order_usage_current IS NOT NULL THEN
	IF myrec.order_fct_hierarchic <= order_fct_hierarchic THEN
		order_fct_hierarchic := myrec.order_fct_hierarchic;
		function_hierarchic := myrec.function_hierarchic;
		IF myrec.order_usage_current <= order_usage_current THEN
			order_usage_current := myrec.order_usage_current;
			usage_current := myrec.usage_current;
		END IF;
	END IF;
  END IF;
END LOOP;
-- in case there is no outgoing channel/reach we need to examine incoming reaches
IF function_hierarchic IS NULL THEN
  FOR myrec
    IN SELECT
	  channel_to.function_hierarchic,
	  vl_fct_hier.order_fct_hierarchic,
	  channel_to.usage_current,
	  vl_usg_curr.order_usage_current
      FROM qgep.od_wastewater_networkelement ne
      LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement
      LEFT JOIN qgep.od_reach re_to ON re_to.fk_reach_point_to = rp.obj_id
      LEFT JOIN qgep.od_wastewater_networkelement ne_to ON ne_to.obj_id = re_to.obj_id
      LEFT JOIN qgep.od_wastewater_structure struct_to ON ne_to.fk_wastewater_structure = struct_to.obj_id
      LEFT JOIN qgep.od_channel channel_to ON channel_to.obj_id = struct_to.obj_id
      LEFT JOIN qgep.vl_channel_function_hierarchic vl_fct_hier ON channel_to.function_hierarchic = vl_fct_hier.code
      LEFT JOIN qgep.vl_channel_usage_current vl_usg_curr ON channel_to.usage_current = vl_usg_curr.code
      WHERE ne.obj_id = network_element_obj_id
      AND channel_to.function_hierarchic IS NOT NULL
      AND channel_to.usage_current IS NOT NULL
      ORDER BY vl_fct_hier.order_fct_hierarchic ASC, vl_usg_curr.order_usage_current ASC
  LOOP
    IF myrec.order_fct_hierarchic IS NOT NULL AND myrec.order_usage_current IS NOT NULL THEN
	IF myrec.order_fct_hierarchic <= order_fct_hierarchic THEN
		order_fct_hierarchic := myrec.order_fct_hierarchic;
		function_hierarchic := myrec.function_hierarchic;
		IF myrec.order_usage_current <= order_usage_current THEN
			order_usage_current := myrec.order_usage_current;
			usage_current := myrec.usage_current;
		END IF;
	END IF;
    END IF;
  END LOOP;
END IF;
return_vals.function_hierarchic := function_hierarchic;
return_vals.usage_current := usage_current;
RETURN return_vals;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Function to create the labels for wastewater_structures with elevation values from incoming reaches
CREATE OR REPLACE FUNCTION qgep.wastewater_structure_label_detailed(structure_obj_id character varying, network_element_obj_id character varying)
  RETURNS text AS
$BODY$DECLARE
myrec_struct_identifier record;
myrec_incoming record;
myrec_cover record;
myrec_outgoing record;
label text;
BEGIN
BEGIN
  SELECT identifier, obj_id into myrec_struct_identifier FROM qgep.od_wastewater_structure WHERE obj_id = structure_obj_id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'no record found in table qgep.od_wastewater_structure for obj_id %', structure_obj_id;
        WHEN TOO_MANY_ROWS THEN
	   RAISE EXCEPTION 'more than one record found in table qgep.od_wastewater_structure for obj_id %', structure_obj_id;
END;
IF myrec_struct_identifier.identifier IS NOT NULL THEN
  label = myrec_struct_identifier.identifier;
ELSE
  label = myrec_struct_identifier.obj_id;
END IF;
FOR myrec_cover IN SELECT 'D='||round(cov.level,2) AS text_cover FROM qgep.od_cover cov WHERE cov.obj_id = structure_obj_id ORDER BY cov.level DESC LIMIT 1 LOOP
  label = label || '
' || myrec_cover.text_cover;
END LOOP;
FOR myrec_incoming IN SELECT 'E'||row_number() over(ORDER BY ST_Azimuth(rp.situation_geometry,ST_Line_Interpolate_Point(ST_GeometryN(re_to.progression,1),0.99))/pi()*180 ASC)||'='||round(rp.level,2) AS text_incoming FROM qgep.od_reach_point rp LEFT JOIN qgep.od_reach re_to ON rp.obj_id = re_to.fs_reach_point_to WHERE rp.fs_wastewater_networkelement = network_element_obj_id AND rp.level IS NOT NULL AND round(rp.level) != 0 AND re_to.obj_id IS NOT NULL ORDER BY ST_Azimuth(rp.situation_geometry,ST_Line_Interpolate_Point(ST_GeometryN(re_to.progression,1),0.99))/pi()*180 ASC LOOP
  label = label || '
' || myrec_incoming.text_incoming;
END LOOP;
FOR myrec_outgoing IN SELECT 'A='||round(rp.level,2) AS text_outgoing FROM qgep.od_reach_point rp LEFT JOIN qgep.od_reach re_from ON rp.obj_id = re_from.fs_reach_point_from WHERE rp.fs_wastewater_networkelement = network_element_obj_id AND rp.level IS NOT NULL AND round(rp.level) != 0 AND re_from.obj_id IS NOT NULL ORDER BY rp.level DESC LOOP
  label = label || '
' || myrec_outgoing.text_outgoing;
END LOOP;
RETURN label;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


  -------------------- SYMBOLOGY UPDATE ON CHANNEL TABLE CHANGES ----------------------

CREATE OR REPLACE FUNCTION qgep.ws_symbology_update_by_channel()
  RETURNS trigger AS
$BODY$
DECLARE
  ws_obj_id RECORD;
  symb_attribs RECORD;
  affected_obj_ids TEXT[];
BEGIN
  CASE
    WHEN TG_OP = 'UPDATE' THEN
      affected_obj_ids = ARRAY[NEW.obj_id, OLD.obj_id];
    WHEN TG_OP = 'INSERT' THEN
      affected_obj_ids = ARRAY[NEW.obj_id];
    WHEN TG_OP = 'DELETE' THEN
      affected_obj_ids = ARRAY[OLD.obj_id];
  END CASE;

  FOR ws_obj_id IN
    SELECT ws.obj_id
      FROM qgep.od_wastewater_structure ws
      LEFT JOIN qgep.od_wastewater_networkelement ne ON ws.obj_id = ne.fk_wastewater_structure
      LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement
      LEFT JOIN qgep.od_reach re ON (re.fk_reach_point_from = rp.obj_id OR re.fk_reach_point_to = rp.obj_id )
      LEFT JOIN qgep.od_wastewater_networkelement rene ON rene.obj_id = re.obj_id
      WHERE rene.fk_wastewater_structure = ANY ( affected_obj_ids )
  LOOP
      SELECT * FROM qgep.wastewater_structure_symbology_attribs( ws_obj_id.obj_id  )
        INTO symb_attribs;
      UPDATE qgep.od_wastewater_structure
      SET
        _usage_current = symb_attribs.usage_current,
        _function_hierarchic = symb_attribs.function_hierarchic
      WHERE
        obj_id = ws_obj_id.obj_id;

      -- RAISE NOTICE 'Updating wastewater_structure (%, %)', ws_obj_id.obj_id, symb_attribs.usage_current;
  END LOOP;
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS ws_symbology_update_by_channel ON qgep.od_channel;

CREATE TRIGGER ws_symbology_update_by_channel
  AFTER INSERT OR UPDATE OR DELETE
  ON qgep.od_channel
  FOR EACH ROW
  EXECUTE PROCEDURE qgep.ws_symbology_update_by_channel();

  -------------------- SYMBOLOGY UPDATE ON REACH POINT TABLE CHANGES ----------------------

CREATE OR REPLACE FUNCTION qgep.ws_symbology_update_by_reach_point()
  RETURNS trigger AS
$BODY$
DECLARE
  ws_obj_id RECORD;
  symb_attribs RECORD;
  affected_obj_ids TEXT[];
BEGIN
  CASE
    WHEN TG_OP = 'UPDATE' THEN
      affected_obj_ids = ARRAY[NEW.obj_id, OLD.obj_id];
    WHEN TG_OP = 'INSERT' THEN
      affected_obj_ids = ARRAY[NEW.obj_id];
    WHEN TG_OP = 'DELETE' THEN
      affected_obj_ids = ARRAY[OLD.obj_id];
  END CASE;

  FOR ws_obj_id IN
    SELECT ws.obj_id
      FROM qgep.od_wastewater_structure ws
      LEFT JOIN qgep.od_wastewater_networkelement ne ON ws.obj_id = ne.fk_wastewater_structure
      LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement
      WHERE rp.obj_id = ANY ( affected_obj_ids )
  LOOP
    SELECT * FROM qgep.wastewater_structure_symbology_attribs( ws_obj_id.obj_id  )
        INTO symb_attribs;
      UPDATE qgep.od_wastewater_structure
      SET
        _usage_current = symb_attribs.usage_current,
        _function_hierarchic = symb_attribs.function_hierarchic
      WHERE
        obj_id = ws_obj_id.obj_id;

      -- RAISE NOTICE 'Updating wastewater_structure (%, %)', ws_obj_id.obj_id, symb_attribs.usage_current;
  END LOOP;
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  DROP TRIGGER IF EXISTS ws_symbology_update_by_reach_point ON qgep.od_reach_point;

-- only update -> insert and delete are handled by reach trigger
CREATE TRIGGER ws_symbology_update_by_reach_point
  AFTER UPDATE
    ON qgep.od_reach_point
  FOR EACH ROW
    EXECUTE PROCEDURE qgep.ws_symbology_update_by_reach_point();


  -------------------- SYMBOLOGY UPDATE ON REACH TABLE CHANGES ----------------------

CREATE OR REPLACE FUNCTION qgep.ws_symbology_update_by_reach()
  RETURNS trigger AS
$BODY$
DECLARE
  ws_obj_id RECORD;
  symb_attribs RECORD;
  affected_obj_ids TEXT[];
BEGIN
  CASE
    WHEN TG_OP = 'UPDATE' THEN
      affected_obj_ids = ARRAY[NEW.obj_id, OLD.obj_id];
    WHEN TG_OP = 'INSERT' THEN
      affected_obj_ids = ARRAY[NEW.obj_id];
    WHEN TG_OP = 'DELETE' THEN
      affected_obj_ids = ARRAY[OLD.obj_id];
  END CASE;

  FOR ws_obj_id IN
    SELECT ws.obj_id
      FROM qgep.od_wastewater_structure ws
      LEFT JOIN qgep.od_wastewater_networkelement ne ON ws.obj_id = ne.fk_wastewater_structure
      LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement
      LEFT JOIN qgep.od_reach re ON ( rp.obj_id = re.fk_reach_point_from OR rp.obj_id = re.fk_reach_point_to )
      WHERE re.obj_id = ANY ( affected_obj_ids )
  LOOP
    SELECT * FROM qgep.wastewater_structure_symbology_attribs( ws_obj_id.obj_id  )
        INTO symb_attribs;
      UPDATE qgep.od_wastewater_structure
      SET
        _usage_current = symb_attribs.usage_current,
        _function_hierarchic = symb_attribs.function_hierarchic
      WHERE
        obj_id = ws_obj_id.obj_id;

      -- RAISE NOTICE 'Updating wastewater_structure (%, %)', ws_obj_id.obj_id, symb_attribs.usage_current;
  END LOOP;
  RETURN NEW;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

  DROP TRIGGER IF EXISTS ws_symbology_update_by_reach ON qgep.od_reach;

CREATE TRIGGER ws_symbology_update_by_reach
  AFTER INSERT OR UPDATE OR DELETE
    ON qgep.od_reach
  FOR EACH ROW
    EXECUTE PROCEDURE qgep.ws_symbology_update_by_reach();
