UPDATE abwasser.siedlungsentwaesserung__abwasserbauwerk AS awb
SET the_geom = awbg.the_geom
FROM abwasser.od_wastewater_structure AS awbg
WHERE awbg.obj_id = regexp_replace(awb.obj_id, ' ', '_');