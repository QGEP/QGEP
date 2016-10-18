------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_structure_part DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_structure_part ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_cover;
DELETE FROM qgep.od_access_aid;
DELETE FROM qgep.od_structure_part;

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_structure_part
(obj_id, identifier, remark, renovation_demand, last_modification, fk_dataowner, fk_wastewater_structure)
SELECT a_bauwerksteil.obj_id, bezeichnung, bemerkung,
  CASE WHEN instandstellung = 0 THEN 138 --- not_necessary
    WHEN instandstellung = 1 THEN 137 --- necessary
    WHEN instandstellung = 2 THEN 5358 --- unknown
  END,
  to_timestamp (LETZTE_AENDERUNG, 'DD MON YYYY'),
  org_dataowner.obj_id,
  q_wastewater_structure.obj_id
FROM abwasser.siedlungsentwaesserung__BauwerksTeil a_bauwerksteil
LEFT JOIN qgep.od_wastewater_structure q_wastewater_structure ON a_bauwerksteil.abwasserbauwerk = q_wastewater_structure.old_obj_id
LEFT JOIN qgep.od_organisation org_dataowner ON org_dataowner.identifier = MD_DATENHERR;

-- 4. update der oid spalten
UPDATE qgep.od_structure_part SET old_obj_id=obj_id;
