-- this post-processing script updates non-standard attributes necessary for symbology - e.g. for manholes
-- update _usage_current and _function_hierarchic for manholes
-- caution: this script can run for several minutes!
UPDATE qgep.od_manhole
   SET _usage_current=(SELECT usage_current FROM qgep.manhole_symbology_attribs(obj_id)),
       _function_hierarchic=(SELECT function_hierarchic FROM qgep.manhole_symbology_attribs(obj_id))
;
-- set manhole orientation to zero where it isn't already set
UPDATE qgep.od_manhole SET _orientation = 0 WHERE _orientation IS NULL;

-- set width/height ratio of pipe_profile to 1.0 if set to NULL
UPDATE qgep.od_pipe_profile SET height_width_ratio=1 WHERE height_width_ratio IS NULL;

