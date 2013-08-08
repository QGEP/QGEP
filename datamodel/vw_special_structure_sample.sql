-- View: qgep.vw_special_structure_sample

DROP VIEW IF EXISTS qgep.vw_special_structure_sample;

CREATE OR REPLACE VIEW qgep.vw_special_structure_sample AS 
 SELECT ss.gid, ss.obj_id, str.detail_geometry_geometry AS the_geom, ss.bypass, ss.depth, ss.function, ss.stormwatertank_arrangement, ss.upper_elevation, str.obj_id AS obj_id_structure, str.identifier AS identifier_structure, str.accessibility, str.disposition_state, str.location_name, str.remark AS remark_structure, str.renovation_demand, str.structure_condition, str.year_of_construction, str.year_of_replacement, qgep.manhole_usage(ne.obj_id::text) AS usage_current, 
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
   WHERE contains(geometryfromtext('POLYGON((749765 263730, 749765 263600, 749909 263600,749909 263730 , 749765 263730))'::text, 21781), str.detail_geometry_geometry)
  GROUP BY ss.gid, ss.obj_id, str.detail_geometry_geometry, ss.bypass, ss.depth, ss.function, ss.stormwatertank_arrangement, ss.upper_elevation, str.obj_id, str.identifier, str.accessibility, str.disposition_state, str.location_name, str.remark, str.renovation_demand, str.structure_condition, str.year_of_construction, str.year_of_replacement, ne.obj_id;
