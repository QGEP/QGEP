-- Function: qgep.manhole_symbology_attribs(text)
-- This function allows to determine the function_hierarchic and usage_current of a given manhole
-- in order to properly style the manhole.
-- Determination of these attributes is based on the outgoing reaches (ordered by hierarchy) - if any - or incoming reaches
-- if there are no outgoing reaches

-- DROP FUNCTION qgep.manhole_symbology_attribs(text);

-- NEW return type necessary for the function below
CREATE TYPE qgep.manhole_symbology_attribs AS
   (function_hierarchic smallint,
    usage_current smallint);

CREATE OR REPLACE FUNCTION qgep.manhole_symbology_attribs(manhole_object_id text)
  RETURNS qgep.manhole_symbology_attribs AS
$BODY$DECLARE
myrec record;
return_vals qgep.manhole_symbology_attribs;
network_element_obj_id character varying(16);
order_fct_hierarchic smallint := 99;
order_usage_current smallint := 99;
function_hierarchic smallint := NULL;
usage_current smallint := NULL;
BEGIN
-- first get the relevant network_element obj_id
SELECT INTO myrec ne.obj_id FROM qgep.od_manhole mh LEFT JOIN qgep.od_wastewater_structure str ON mh.obj_id = str.obj_id LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.fk_wastewater_structure = str.obj_id
WHERE mh.obj_id = manhole_object_id;
network_element_obj_id := myrec.obj_id;
-- process first only outgoing channels/reaches
-- need to process multiple outgoing reaches in order of function_hierarchic and usage_current
FOR myrec IN SELECT channel_from.function_hierarchic, vl_fct_hier.order_fct_hierarchic, channel_from.usage_current, vl_usg_curr.order_usage_current FROM qgep.od_wastewater_networkelement ne LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement LEFT JOIN qgep.od_reach re_from ON re_from.fk_reach_point_from = rp.obj_id LEFT JOIN qgep.od_wastewater_networkelement ne_from ON ne_from.obj_id = re_from.obj_id LEFT JOIN qgep.od_wastewater_structure struct_from ON ne_from.fk_wastewater_structure = struct_from.obj_id LEFT JOIN qgep.od_channel channel_from ON channel_from.obj_id = struct_from.obj_id LEFT JOIN qgep.vl_channel_function_hierarchic vl_fct_hier ON channel_from.function_hierarchic = vl_fct_hier.code LEFT JOIN qgep.vl_channel_usage_current vl_usg_curr ON channel_from.usage_current = vl_usg_curr.code WHERE ne.obj_id = network_element_obj_id AND channel_from.function_hierarchic IS NOT NULL AND channel_from.usage_current IS NOT NULL ORDER BY vl_fct_hier.order_fct_hierarchic ASC, vl_usg_curr.order_usage_current ASC LOOP
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
  FOR myrec IN SELECT channel_to.function_hierarchic, vl_fct_hier.order_fct_hierarchic, channel_to.usage_current, vl_usg_curr.order_usage_current FROM qgep.od_wastewater_networkelement ne LEFT JOIN qgep.od_reach_point rp ON ne.obj_id = rp.fk_wastewater_networkelement LEFT JOIN qgep.od_reach re_to ON re_to.fk_reach_point_to = rp.obj_id LEFT JOIN qgep.od_wastewater_networkelement ne_to ON ne_to.obj_id = re_to.obj_id LEFT JOIN qgep.od_wastewater_structure struct_to ON ne_to.fk_wastewater_structure = struct_to.obj_id LEFT JOIN qgep.od_channel channel_to ON channel_to.obj_id = struct_to.obj_id LEFT JOIN qgep.vl_channel_function_hierarchic vl_fct_hier ON channel_to.function_hierarchic = vl_fct_hier.code LEFT JOIN qgep.vl_channel_usage_current vl_usg_curr ON channel_to.usage_current = vl_usg_curr.code WHERE ne.obj_id = network_element_obj_id AND channel_to.function_hierarchic IS NOT NULL AND channel_to.usage_current IS NOT NULL ORDER BY vl_fct_hier.order_fct_hierarchic ASC, vl_usg_curr.order_usage_current ASC LOOP
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

-- Function to create the labels for manholes with elevation values from incoming reaches
CREATE OR REPLACE FUNCTION qgep.manhole_label_detailed(structure_obj_id character varying, network_element_obj_id character varying)
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

-- DROP VIEW qgep.vw_manhole;

CREATE OR REPLACE VIEW qgep.vw_manhole AS 
 SELECT mh.obj_id, mh.depth, 
        CASE
            WHEN mh.dimension1 > 0 THEN mh.dimension1::numeric / 1000::numeric
            ELSE 0.9
        END AS dimension1, 
        CASE
            WHEN mh.dimension1 IS NULL AND mh.dimension2 IS NULL THEN 0.9
            WHEN mh.dimension2::numeric > 0::numeric THEN mh.dimension2::numeric / 1000::numeric
            ELSE mh.dimension1::numeric / 1000::numeric
        END AS dimension2, mh.function, mh.material, mh.surface_inflow, qgep.manhole_usage(ne.obj_id::text) AS usage_current, str.obj_id AS obj_id_structure, str.identifier AS identifier_structure, str.accessibility, str.status, str.location_name, str.remark AS remark_structure, str.renovation_necessity, str.structure_condition, str.year_of_construction, str.year_of_replacement, ne.obj_id AS ne_obj_id, max(nod.obj_id::text) AS node_obj_id, max(nod.bottom_level) AS bottom_level, max(nod.backflow_level) AS backflow_level, max(nod.situation_geometry::text) AS the_geom_node, max(rp.situation_geometry::text) AS the_geom_reach_point, count(re_to.obj_id) AS nr_incoming_reaches, count(re_from.obj_id) AS nr_outgoing_reaches, qgep.manhole_label_detailed(str.obj_id, ne.obj_id) AS label_detailed, 
        CASE
            WHEN qgep.manhole_usage(ne.obj_id::text) = ANY (ARRAY[4514, 4518, 4520]) THEN '#0000ff'::text
            WHEN qgep.manhole_usage(ne.obj_id::text) = 4516 THEN '#00ff6f'::text
            WHEN qgep.manhole_usage(ne.obj_id::text) = 4522 THEN '#660066'::text
            WHEN qgep.manhole_usage(ne.obj_id::text) = ANY (ARRAY[4524, 4526]) THEN '#ff0000'::text
            ELSE '#969696'::text
        END AS usage_color, ('<p>'::text || rtrim(((((COALESCE(str.identifier::text || '<br/>'::text, ''::text) || COALESCE((('Dimension: '::text || mh.dimension1) || COALESCE('/'::text || mh.dimension2, ''::text)) || '<br/>'::text, ''::text)) || COALESCE(('Funktion: '::text || mh_func.value_de::text) || '<br/>'::text, ''::text)) || COALESCE(('Material: '::text || mh_mat.value_de::text) || '<br/>'::text, ''::text)) || COALESCE(('Sohlenkote: '::text || max(nod.bottom_level)) || '<br/>'::text, ''::text)) || COALESCE(('Rückstaukote: '::text || max(nod.backflow_level)) || '<br/>'::text, ''::text), '<br/>'::text)) || '</p>'::text AS tooltip
   FROM qgep.od_manhole mh
   LEFT JOIN qgep.od_wastewater_structure str ON mh.obj_id::text = str.obj_id::text
   LEFT JOIN qgep.od_wastewater_networkelement ne ON str.obj_id::text = ne.fs_wastewater_structure::text
   LEFT JOIN qgep.od_wastewater_node nod ON str.obj_id::text = nod.obj_id::text
   LEFT JOIN qgep.od_reach_point rp ON rp.fs_wastewater_networkelement::text = ne.obj_id::text
   LEFT JOIN qgep.od_reach re_to ON rp.obj_id::text = re_to.fs_reach_point_to::text
   LEFT JOIN qgep.od_reach re_from ON rp.obj_id::text = re_from.fs_reach_point_from::text
   LEFT JOIN qgep.vl_manhole_function mh_func ON mh.function = mh_func.code
   LEFT JOIN qgep.vl_manhole_material mh_mat ON mh.material = mh_mat.code
  GROUP BY mh.obj_id, mh.depth, mh.dimension1, mh.dimension2, mh.function, mh.material, mh.surface_inflow, str.obj_id, str.accessibility, str.status, str.identifier, str.location_name, str.remark, str.renovation_necessity, str.structure_condition, str.year_of_construction, str.year_of_replacement, ne.obj_id, mh_func.value_de, mh_mat.value_de;

----------------

-- DROP VIEW qgep.vw_reach;

CREATE OR REPLACE VIEW qgep.vw_reach AS 
 SELECT re.obj_id, re.coefficient_of_friction, pp.identifier AS pipe_profile, re.max_height_profile, 
        CASE
            WHEN re.max_height_profile > 0 THEN re.max_height_profile::numeric / 1000::numeric
            ELSE NULL::numeric
        END AS max_height_profile_m, 
        CASE
            WHEN pp.height_width_ratio IS NOT NULL AND re.max_height_profile IS NOT NULL THEN re.max_height_profile::numeric / pp.height_width_ratio
            WHEN pp.height_width_ratio IS NULL AND re.max_height_profile IS NOT NULL THEN re.max_height_profile::numeric
            ELSE NULL::numeric
        END AS width, 
        CASE
            WHEN pp.height_width_ratio IS NOT NULL AND re.max_height_profile IS NOT NULL THEN re.max_height_profile::numeric / pp.height_width_ratio / 1000::numeric
            WHEN pp.height_width_ratio IS NULL AND re.max_height_profile IS NOT NULL THEN re.max_height_profile::numeric / 1000::numeric
            ELSE NULL::numeric
        END AS width_m, re.elevation_determination, re.horizontal_positioning, re.inside_coating, re.length_effective, re.material, re.progression, re.progression3d_geometry, re.slope_building_plan, re.wall_roughness, re.fs_reach_point_from, re.fs_reach_point_to, re.fs_pipe_profile, ch.bedding_encasement, ch.connection_type, ch.function_hierarchic, ch.function_hydraulic, ch.jetting_interval, ch.pipe_length, ch.usage_current, 
        CASE
            WHEN ch.usage_current = ANY (ARRAY[4514, 4518, 4520]) THEN '#0000ff'::text
            WHEN ch.usage_current = 4516 THEN '#00ff6f'::text
            WHEN ch.usage_current = 4522 THEN '#660066'::text
            WHEN ch.usage_current = ANY (ARRAY[4524, 4526]) THEN '#ff0000'::text
            ELSE '#969696'::text
        END AS usage_current_color, ch.usage_planned, str.accessibility, str.status, str.identifier AS identifier_structure, str.location_name, str.remark AS remark_structure, str.renovation_necessity, str.structure_condition, str.year_of_construction, str.year_of_replacement, rp_from.obj_id AS rp_from_obj_id, rp_from.identifier AS rp_from_identifier, rp_from.level AS rp_from_level, rp_from.outlet_shape AS rp_from_outlet_shape, rp_from.remark AS rp_from_remark, rp_from.situation_geometry AS rp_from_the_geom, str_from.obj_id AS str_from_obj_id, 
        CASE
            WHEN ch_from.obj_id IS NOT NULL THEN 'channel'::text
            WHEN mh_from.obj_id IS NOT NULL THEN 'manhole'::text
            WHEN re_from.obj_id IS NOT NULL THEN 'reach'::text
            WHEN sp_from.obj_id IS NOT NULL THEN 'special_structure'::text
            ELSE NULL::text
        END AS str_from_type, rp_to.obj_id AS rp_to_obj_id, rp_to.identifier AS rp_to_identifier, rp_to.level AS rp_to_level, rp_to.outlet_shape AS rp_to_outlet_shape, rp_to.remark AS rp_to_remark, rp_to.situation_geometry AS rp_to_the_geom, str_to.obj_id AS str_to_obj_id, 
        CASE
            WHEN ch_to.obj_id IS NOT NULL THEN 'channel'::text
            WHEN disch_to.obj_id IS NOT NULL THEN 'discharge_point'::text
            WHEN inf_to.obj_id IS NOT NULL THEN 'infiltration_installation'::text
            WHEN mh_to.obj_id IS NOT NULL THEN 'manhole'::text
            WHEN re_to.obj_id IS NOT NULL THEN 'reach'::text
            WHEN sp_to.obj_id IS NOT NULL THEN 'special_structure'::text
            ELSE NULL::text
        END AS str_to_type, ((COALESCE(mat.abbr_de || ' '::text, ''::text) || COALESCE(re.max_height_profile || ' '::text, ''::text)) || COALESCE(('-'::text || re.length_effective) || '-'::text, ''::text)) || COALESCE(' '::text || 
        CASE
            WHEN rp_from.level IS NOT NULL AND rp_to.level IS NOT NULL THEN round((rp_from.level - rp_to.level) / re.length_effective * 1000::numeric, 1) || '‰ '::text
            ELSE NULL::text
        END, ''::text) AS label, (('<p>'::text || COALESCE(('Objekt-ID='::text || str.identifier::text) || '<br/>'::text, ''::text)) || COALESCE(('Länge: '::text || re.length_effective::text) || 'm<br/>'::text, ''::text)) || '</p>'::text AS tooltip
   FROM qgep.od_reach re
   LEFT JOIN qgep.od_pipe_profile pp ON re.fs_pipe_profile::text = pp.obj_id::text
   LEFT JOIN qgep.vl_reach_material mat ON re.material = mat.code
   LEFT JOIN qgep.od_wastewater_networkelement ne ON ne.obj_id::text = re.obj_id::text
   LEFT JOIN qgep.od_wastewater_structure str ON ne.fs_wastewater_structure::text = str.obj_id::text
   LEFT JOIN qgep.od_channel ch ON ch.obj_id::text = str.obj_id::text
   LEFT JOIN qgep.od_reach_point rp_from ON re.fs_reach_point_from::text = rp_from.obj_id::text
   LEFT JOIN qgep.od_wastewater_networkelement ne_from ON rp_from.fs_wastewater_networkelement::text = ne_from.obj_id::text
   LEFT JOIN qgep.od_wastewater_structure str_from ON ne_from.fs_wastewater_structure::text = str_from.obj_id::text
   LEFT JOIN qgep.od_manhole mh_from ON mh_from.obj_id::text = str_from.obj_id::text
   LEFT JOIN qgep.od_special_structure sp_from ON sp_from.obj_id::text = str_from.obj_id::text
   LEFT JOIN qgep.od_reach re_from ON re_from.obj_id::text = str_from.obj_id::text
   LEFT JOIN qgep.od_channel ch_from ON ch_from.obj_id::text = str_from.obj_id::text
   LEFT JOIN qgep.od_reach_point rp_to ON re.fs_reach_point_to::text = rp_to.obj_id::text
   LEFT JOIN qgep.od_wastewater_networkelement ne_to ON rp_to.fs_wastewater_networkelement::text = ne_to.obj_id::text
   LEFT JOIN qgep.od_wastewater_structure str_to ON ne_to.fs_wastewater_structure::text = str_to.obj_id::text
   LEFT JOIN qgep.od_manhole mh_to ON mh_to.obj_id::text = str_to.obj_id::text
   LEFT JOIN qgep.od_special_structure sp_to ON sp_to.obj_id::text = str_to.obj_id::text
   LEFT JOIN qgep.od_reach re_to ON re_to.obj_id::text = str_to.obj_id::text
   LEFT JOIN qgep.od_channel ch_to ON ch_to.obj_id::text = str_to.obj_id::text
   LEFT JOIN qgep.od_infiltration_installation inf_to ON inf_to.obj_id::text = str_to.obj_id::text
   LEFT JOIN qgep.od_discharge_point disch_to ON disch_to.obj_id::text = str_to.obj_id::text;

-----------------------

-- View: qgep.vw_special_structure

-- DROP VIEW qgep.vw_special_structure;

CREATE OR REPLACE VIEW qgep.vw_special_structure AS 
 SELECT ss.obj_id, str.detail_geometry_geometry AS the_geom, ss.bypass, ss.depth, ss.function, ss.stormwatertank_arrangement, ss.upper_elevation, str.obj_id AS obj_id_structure, str.identifier AS identifier_structure, str.accessibility, str.status, str.location_name, str.remark AS remark_structure, str.renovation_necessity, str.structure_condition, str.year_of_construction, str.year_of_replacement, qgep.manhole_usage(ne.obj_id::text) AS usage_current, 
        CASE
            WHEN qgep.manhole_usage(ne.obj_id::text) = ANY (ARRAY[4514, 4518, 4520]) THEN '#0000ff'::text
            WHEN qgep.manhole_usage(ne.obj_id::text) = 4516 THEN '#00ff6f'::text
            WHEN qgep.manhole_usage(ne.obj_id::text) = 4522 THEN '#660066'::text
            WHEN qgep.manhole_usage(ne.obj_id::text) = ANY (ARRAY[4524, 4526]) THEN '#ff0000'::text
            ELSE '#969696'::text
        END AS usage_color, ne.obj_id AS ne_obj_id, max(nod.obj_id::text) AS node_obj_id, max(nod.bottom_level) AS bottom_level, max(nod.bottom_level) AS backflow_level, max(nod.situation_geometry::text) AS the_geom_node, count(re_to.obj_id) AS nr_incoming_reaches, count(re_from.obj_id) AS nr_outgoing_reaches, qgep.manhole_label_detailed(str.obj_id, ne.obj_id) AS label_detailed
   FROM qgep.od_special_structure ss
   LEFT JOIN qgep.od_wastewater_structure str ON ss.obj_id::text = str.obj_id::text
   LEFT JOIN qgep.od_wastewater_networkelement ne ON str.obj_id::text = ne.fs_wastewater_structure::text
   LEFT JOIN qgep.od_wastewater_node nod ON str.obj_id::text = nod.obj_id::text
   LEFT JOIN qgep.od_reach_point rp ON rp.fs_wastewater_networkelement::text = ne.obj_id::text
   LEFT JOIN qgep.od_reach re_to ON rp.obj_id::text = re_to.fs_reach_point_to::text
   LEFT JOIN qgep.od_reach re_from ON rp.obj_id::text = re_from.fs_reach_point_from::text
  GROUP BY ss.obj_id, str.detail_geometry_geometry, ss.bypass, ss.depth, ss.function, ss.stormwatertank_arrangement, ss.upper_elevation, str.obj_id, str.identifier, str.accessibility, str.status, str.location_name, str.remark, str.renovation_necessity, str.structure_condition, str.year_of_construction, str.year_of_replacement, ne.obj_id;
