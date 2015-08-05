-- this post-processing script updates non-standard attributes necessary for
-- symbology - e.g. for wastewaster_structures, in particular manholes
-- update _usage_current and _function_hierarchic for wastewater_structure
-- caution: this script can run for several minutes!
UPDATE qgep.od_wastewater_structure
   SET _usage_current=(SELECT usage_current FROM qgep.wastewater_structure_symbology_attribs(obj_id)),
       _function_hierarchic=(SELECT function_hierarchic FROM qgep.wastewater_structure_symbology_attribs(obj_id))
;
-- set manhole orientation to zero where it isn't already set
UPDATE qgep.od_manhole SET _orientation = 0 WHERE _orientation IS NULL;

-- set width/height ratio of pipe_profile to 1.0 if set to NULL
UPDATE qgep.od_pipe_profile SET height_width_ratio=1 WHERE height_width_ratio IS NULL;

-- update label text for manholes
-- note the language specific update, needs to be discussed
-- only major manholes get labels
UPDATE qgep.od_manhole mh
   SET _label=qgep.wastewater_structure_label_detailed(mh.obj_id,'en')
   FROM qgep.od_wastewater_structure ws
 WHERE mh.obj_id = ws.obj_id AND ws._function_hierarchic IN (5068,5069,5070,5071);

