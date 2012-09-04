-- View: qgep.vw_reach_point

-- DROP VIEW qgep.vw_reach_point;

CREATE OR REPLACE VIEW qgep.vw_reach_point AS 
 SELECT row_number() OVER (ORDER BY od_reach_point.obj_id) AS gid, od_reach_point.obj_id, od_reach.obj_id AS reach_obj_id, upper_wastewater_node.obj_id AS upper_wastewater_node_obj_id, od_wastewater_networkelement.obj_id AS wastewater_networkelement_obj_id, od_wastewater_networkelement.fs_wastewater_structure AS wastewater_structure_obj_id, od_reach_point.level AS masl, od_reach_point.situation_geometry AS the_geom
   FROM qgep.od_reach_point
   LEFT JOIN qgep.od_wastewater_networkelement ON od_reach_point.fs_wastewater_networkelement::text = od_wastewater_networkelement.obj_id::text
   LEFT JOIN qgep.od_reach ON od_reach_point.fs_wastewater_networkelement::text = od_reach.obj_id::text
   LEFT JOIN qgep.od_reach_point upper_reach_point ON od_reach.fs_reach_point_from::text = upper_reach_point.obj_id::text
   LEFT JOIN qgep.od_wastewater_node upper_wastewater_node ON upper_reach_point.fs_wastewater_networkelement::text = upper_wastewater_node.obj_id::text;
