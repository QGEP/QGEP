------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_access_aid DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_access_aid ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_access_aid;

-- 3. update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
SELECT setval('qgep.seq_od_access_aid_oid', 1, true);
UPDATE qgep.od_structure_part SET obj_id=qgep.generate_oid('od_access_aid')
WHERE qgep.od_structure_part.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__Einstiegshilfe);


-- 4. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_access_aid
(obj_id, old_obj_id, kind)
SELECT 
q_structure_part.obj_id,
a_einstiegshilfe.obj_id,
CASE WHEN art = 0 THEN 5357 --- other
WHEN art = 1 THEN 243 --- pressurized_door
WHEN art = 2 THEN 92 --- none
WHEN art = 3 THEN 240 --- ladder
WHEN art = 4 THEN 241 --- step_iron
WHEN art = 5 THEN 3473 --- staircase
WHEN art = 6 THEN 91 --- footstep_niches
WHEN art = 7 THEN 3230 --- door
WHEN art = 8 THEN 3048 --- unknown
END

FROM abwasser.siedlungsentwaesserung__Einstiegshilfe a_einstiegshilfe
LEFT JOIN qgep.od_structure_part q_structure_part
ON q_structure_part.old_obj_id = a_einstiegshilfe.obj_id;
