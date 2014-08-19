------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_structure_part DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_structure_part ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_structure_part;

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_structure_part
(obj_id, identifier, remark, renovation_demand, last_modification, dataowner) 
SELECT obj_id, bezeichnung, bemerkung,
CASE WHEN instandstellung = 0 THEN 138 --- not_necessary
WHEN instandstellung = 1 THEN 137 --- necessary
WHEN instandstellung = 2 THEN 5358 --- unknown
END,
to_timestamp (LETZTE_AENDERUNG, 'DD MON YYYY'),
MD_DATENHERR 
FROM abwasser.siedlungsentwaesserung__BauwerksTeil;

-- 4. update der oid spalten
UPDATE qgep.od_structure_part SET old_obj_id=obj_id;