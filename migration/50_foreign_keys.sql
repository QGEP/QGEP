﻿UPDATE qgep.od_reach_point
SET fk_wastewater_networkelement = q_wastewater_networkelement.obj_id
FROM abwasser.siedlungsentwaesserung__Haltungspunkt AS a_haltungspunkt
  LEFT JOIN qgep.od_wastewater_networkelement AS q_wastewater_networkelement
  ON a_haltungspunkt.abwassernetzelement = q_wastewater_networkelement.old_obj_id
WHERE a_haltungspunkt.obj_id = qgep.od_reach_point.old_obj_id;