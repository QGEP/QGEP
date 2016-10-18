------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

------ change for 08; class name changed from 'Vorflutereinlauf' to 'Einleitstelle'; 15.05.15 OS

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_discharge_point DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_discharge_point ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_discharge_point;

-- update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
SELECT setval('qgep.seq_od_discharge_point_oid', 1, true);
UPDATE qgep.od_wastewater_structure SET obj_id=qgep.generate_oid('od_discharge_point')
WHERE qgep.od_wastewater_structure.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__vorflutereinlauf);


-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.

INSERT INTO qgep.od_discharge_point
(obj_id, 
old_obj_id,
-- depth, 
highwater_level) 
-- relevance,
-- terrain_level,
-- upper_elevation, 
-- waterlevel_hydraulic)
SELECT 
q_wastewater_structure.obj_id, 
a_vorflutereinlauf.obj_id,
-- maechtigkeit,
hochwasserkote
-- CASE WHEN relevanz = 0 THEN 5580 --- relevant_for_water_course
-- WHEN relevanz = 1 THEN 5581 --- non_relevant_for_water_course
-- END,
-- terrainkote,
-- deckenkote,
-- wasserspiegel_hydraulik
-- FROM abwasser.siedlungsentwaesserung__Einleitstelle;
FROM abwasser.siedlungsentwaesserung__Vorflutereinlauf a_vorflutereinlauf
LEFT JOIN qgep.od_wastewater_structure q_wastewater_structure
ON a_vorflutereinlauf.obj_id = q_wastewater_structure.old_obj_id;
