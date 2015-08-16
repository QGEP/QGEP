UPDATE qgep.od_reach_point
SET fk_wastewater_networkelement = q_NO.obj_id
FROM qgep.od_reach_point q_RP
  INNER JOIN abwasser.siedlungsentwaesserung__haltungspunkt AS a_RP ON a_RP.obj_id = q_RP.old_obj_id
  INNER JOIN qgep.od_wastewater_networkelement AS q_NO
    ON a_RP.abwassernetzelement = q_NO.old_obj_id
WHERE a_RP.obj_id = qgep.od_reach_point.old_obj_id;
