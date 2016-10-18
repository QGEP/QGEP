------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_wastewater_networkelement DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_wastewater_networkelement ADD COLUMN old_obj_id text;
CREATE UNIQUE INDEX ON qgep.od_wastewater_networkelement(old_obj_id);

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_wastewater_node;
DELETE FROM qgep.od_wastewater_networkelement;
DELETE FROM qgep.od_reach_point;



-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_wastewater_networkelement
(obj_id, identifier, remark, last_modification, fk_dataowner, fk_wastewater_structure)
SELECT a_abwassernetzelement.obj_id,
bezeichnung, bemerkung,
to_timestamp (LETZTE_AENDERUNG, 'DD MMM YYYY'),
org_dataowner.obj_id,
q_wastewater_structure.obj_id
FROM abwasser.siedlungsentwaesserung__abwassernetzelement a_abwassernetzelement
LEFT JOIN qgep.od_wastewater_structure q_wastewater_structure ON q_wastewater_structure.old_obj_id = a_abwassernetzelement.abwasserbauwerk
LEFT JOIN qgep.od_organisation org_dataowner ON org_dataowner.identifier = MD_DATENHERR;

-- update der oid spalten
UPDATE qgep.od_wastewater_networkelement SET old_obj_id=qgep.od_wastewater_networkelement.obj_id;
