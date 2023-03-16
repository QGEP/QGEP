------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

------ change for 08; attributes of function; 15.05.15 OS

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_special_structure DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_special_structure ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_special_structure;


-- update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
SELECT setval('qgep.seq_od_special_structure_oid', 1, true);
UPDATE qgep.od_wastewater_structure SET obj_id=qgep.generate_oid('od_special_structure')
WHERE qgep.od_wastewater_structure.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__spezialbauwerk);

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_special_structure
(obj_id, old_obj_id, bypass, function)
SELECT 
q_wastewater_structure.obj_id,  
a_spezialbauwerk.obj_id,
CASE WHEN bypass = 0 THEN 2682 --- inexistent
WHEN bypass = 1 THEN 3055 --- unknown
WHEN bypass = 2 THEN 2681 --- existent
END AS bypass,
-- emergency_spillway CASE WHEN notueberlauf = 0 THEN 5866 --- other
-- WHEN notueberlauf = 1 THEN 5864 --- in_combined_waste_water_drain
-- WHEN notueberlauf = 2 THEN 5865 --- in_rain_waste_water_drain
-- WHEN notueberlauf = 3 THEN 5863 --- in_waste_water_drain
-- WHEN notueberlauf = 4 THEN 5878 --- none
-- WHEN notueberlauf = 5 THEN 5867 --- unknown
-- END,
CASE WHEN funktion = 0 THEN 245 --- drop_structure
WHEN funktion = 1 THEN 5371 --- other
WHEN funktion = 2 THEN 386 --- venting
WHEN funktion = 3 THEN 5091 --- syphon_head
WHEN funktion = 4 THEN 3348 --- terrain_depression
WHEN funktion = 5 THEN 336 --- bolders_bedload_catchement_dam
WHEN funktion = 6 THEN 5372 --- stormwater_overflow
WHEN funktion = 7 THEN 5494 --- cesspit
WHEN funktion = 8 THEN 6478 --- septic_tank
WHEN funktion = 9 THEN 2998 --- manhole
WHEN funktion = 10 THEN 2768 --- oil_separator
WHEN funktion = 11 THEN 246 --- pump_station
WHEN funktion = 12 THEN 3673 --- stormwater_tank_with_overflow
WHEN funktion = 13 THEN 3674 --- stormwater_tank_retaining_first_flush
WHEN funktion = 14 THEN 3675 --- stormwater_sedimentation_tank
WHEN funktion = 15 THEN 3676 --- stormwater_retention_tank
WHEN funktion = 16 THEN 3677 --- stormwater_composite_tank
WHEN funktion = 17 THEN 5373 --- floating_material_separator
WHEN funktion = 18 THEN 383 --- side_access
WHEN funktion = 19 THEN 227 --- jetting_manhole
WHEN funktion = 20 THEN 4799 --- separating_structure
WHEN funktion = 21 THEN 3008 --- unknown
WHEN funktion = 22 THEN 2745 --- vortex_manhole
END
-- stormwater_tank_arrangement CASE WHEN regenbecken_anordnung = 0 THEN 4608 --- main_connection
-- WHEN regenbecken_anordnung = 1 THEN 4609 --- side_connection
-- WHEN regenbecken_anordnung = 2 THEN 4610 --- unknown
-- END,
-- deckenkote
FROM abwasser.siedlungsentwaesserung__Spezialbauwerk a_spezialbauwerk
LEFT JOIN qgep.od_wastewater_structure  q_wastewater_structure
ON a_spezialbauwerk.obj_id = q_wastewater_structure.old_obj_id;
