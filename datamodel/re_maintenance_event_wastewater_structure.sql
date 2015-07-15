-------
CREATE TABLE qgep.re_maintenance_event_wastewater_structure
(
  fk_wastewater_structure varchar (16),
  fk_maintenance_event varchar (16),
  CONSTRAINT rel_maintenance_event_wastewater_structure_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id),
  CONSTRAINT rel_maintenance_event_wastewater_structure_maintenance_event FOREIGN KEY (fk_maintenance_event) REFERENCES qgep.od_maintenance_event(obj_id),
  CONSTRAINT pkey_qgep_re_maintenance_event_wastewater_structure_obj_id PRIMARY KEY (fk_wastewater_structure, fk_maintenance_event)
)
WITH (
   OIDS = False
);
