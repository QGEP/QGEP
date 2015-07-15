-------
CREATE TABLE qgep.re_maintenance_event_wastewater_structure
(
   obj_id  varchar(16) NOT NULL,
   CONSTRAINT pkey_qgep_re_maintenance_event_wastewater_structure_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE qgep.seq_re_maintenance_event_wastewater_structure_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qgep.re_maintenance_event_wastewater_structure ALTER COLUMN obj_id SET DEFAULT qgep.generate_oid('re_maintenance_event_wastewater_structure');
COMMENT ON COLUMN qgep.re_maintenance_event_wastewater_structure.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix) or UUOID, see www.interlis.ch';

-------- Relationships ----------
ALTER TABLE qgep.re_maintenance_event_wastewater_structure ADD COLUMN fk_wastewater_structure varchar (16);
ALTER TABLE qgep.re_maintenance_event_wastewater_structure ADD CONSTRAINT rel_maintenance_event_wastewater_structure_wastewater_structure FOREIGN KEY (fk_wastewater_structure) REFERENCES qgep.od_wastewater_structure(obj_id);
ALTER TABLE qgep.re_maintenance_event_wastewater_structure ADD COLUMN fk_maintenance_event varchar (16);
ALTER TABLE qgep.re_maintenance_event_wastewater_structure ADD CONSTRAINT rel_maintenance_event_wastewater_structure_maintenance_event FOREIGN KEY (fk_maintenance_event) REFERENCES qgep.od_maintenance_event(obj_id);
