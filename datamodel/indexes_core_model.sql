CREATE INDEX in_qgep_od_access_aid_obj_id
  ON qgep.od_access_aid
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_benching_obj_id
  ON qgep.od_benching
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_channel_obj_id
  ON qgep.od_channel
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_channel_func_hierarchic_usage_current
  ON qgep.od_channel
  USING btree
  (function_hierarchic , usage_current );

CREATE UNIQUE INDEX in_qgep_od_cover_obj_id
  ON qgep.od_cover
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_cover_situation_geometry
  ON qgep.od_cover
  USING gist
  (situation_geometry );

CREATE UNIQUE INDEX in_qgep_od_discharge_point_obj_id
  ON qgep.od_discharge_point
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_dryweather_flume_obj_id
  ON qgep.od_dryweather_flume
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_dryweather_flume_obj_id
  ON qgep.od_dryweather_flume
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_infiltration_installation_obj_id
  ON qgep.od_infiltration_installation
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_manhole_obj_id
  ON qgep.od_manhole
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_manhole_function
  ON qgep.od_manhole
  USING btree
  (function );

CREATE UNIQUE INDEX in_qgep_od_organisation_obj_id
  ON qgep.od_organisation
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_organisation_identifier
  ON qgep.od_organisation
  USING btree
  (identifier );

CREATE UNIQUE INDEX in_qgep_od_pipe_profile_obj_id
  ON qgep.od_pipe_profile
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_pipe_profile_identifier
  ON qgep.od_pipe_profile
  USING btree
  (identifier );

CREATE UNIQUE INDEX in_qgep_od_reach_obj_id
  ON qgep.od_reach
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_reach_progression
  ON qgep.od_reach
  USING gist
  (progression );

CREATE INDEX in_qgep_od_reach_horizontal_positioning
  ON qgep.od_reach
  USING btree
  (horizontal_positioning );

CREATE INDEX in_qgep_od_reach_fs_reach_point_from
  ON qgep.od_reach
  USING btree
  (fs_reach_point_from );

CREATE INDEX in_qgep_od_reach_fs_reach_point_to
  ON qgep.od_reach
  USING btree
  (fs_reach_point_to );

CREATE INDEX in_qgep_od_reach_fs_pipe_profile
  ON qgep.od_reach
  USING btree
  (fs_pipe_profile );

CREATE UNIQUE INDEX in_qgep_od_reach_point_obj_id
  ON qgep.od_reach_point
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_reach_point_situation_geometry
  ON qgep.od_reach_point
  USING gist
  (situation_geometry );

CREATE UNIQUE INDEX in_qgep_od_reach_point_identifier
  ON qgep.od_reach_point
  USING btree
  (identifier );

CREATE INDEX in_qgep_od_reach_point_fs_wastewater_networkelement
  ON qgep.od_reach_point
  USING btree
  (fs_wastewater_networkelement );

CREATE UNIQUE INDEX in_qgep_od_special_structure_obj_id
  ON qgep.od_special_structure
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_special_structure_function
  ON qgep.od_special_structure
  USING btree
  (function );

CREATE UNIQUE INDEX in_qgep_od_structure_part_obj_id
  ON qgep.od_structure_part
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_structure_part_identifier
  ON qgep.od_structure_part
  USING btree
  (identifier );

CREATE INDEX in_qgep_od_structure_part_fs_wastewater_structure
  ON qgep.od_structure_part
  USING btree
  (fs_wastewater_structure );

CREATE UNIQUE INDEX in_qgep_od_wastewater_networkelement_obj_id
  ON qgep.od_wastewater_networkelement
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_wastewater_networkelement_identifier
  ON qgep.od_wastewater_networkelement
  USING btree
  (identifier );

CREATE INDEX in_qgep_od_wastewater_networkelement_fs_wastewater_structure
  ON qgep.od_wastewater_networkelement
  USING btree
  (fs_wastewater_structure );

CREATE UNIQUE INDEX in_qgep_od_wastewater_node_obj_id
  ON qgep.od_wastewater_node
  USING btree
  (obj_id );

CREATE INDEX in_qgep_od_wastewater_node_situation_geometry
  ON qgep.od_wastewater_node
  USING gist
  (situation_geometry );

CREATE UNIQUE INDEX in_qgep_od_wastewater_structure_obj_id
  ON qgep.od_wastewater_structure
  USING btree
  (obj_id );

CREATE UNIQUE INDEX in_qgep_od_wastewater_structure_identifier
  ON qgep.od_wastewater_structure
  USING btree
  (identifier );

CREATE INDEX in_qgep_od_wastewater_structure_detail_geometry
  ON qgep.od_wastewater_structure
  USING gist
  (detail_geometry_geometry );

CREATE INDEX in_qgep_od_wastewater_structure_fs_owner
  ON qgep.od_wastewater_structure
  USING btree
  (fs_owner );

CREATE INDEX in_qgep_od_wastewater_structure_disposition_state
  ON qgep.od_wastewater_structure
  USING btree
  (disposition_state );

