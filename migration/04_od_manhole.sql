------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

------ changes for 08; order of function, klärgrube --> other; 15.05.15 OS

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_manhole DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_manhole ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_manhole;

-- update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
-- UPDATE qgep.od_manhole SET old_obj_id=obj_id;
SELECT setval('qgep.seq_od_manhole_oid', 1, true);
UPDATE qgep.od_wastewater_structure SET obj_id=qgep.generate_oid('od_manhole')
WHERE qgep.od_wastewater_structure.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__normschacht);
-- UPDATE qgep.od_manhole SET standardoid=qgep.generate_oid('od_manhole');


-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_manhole
(obj_id, old_obj_id, dimension1, dimension2, function, material, surface_inflow) 
-- maechtigkeit weg
SELECT q_wastewater_structure.obj_id, 
a_normschacht.obj_id,
dimension1, dimension2,
CASE  -- (ili bezeichnungen deutsch) nicht function
WHEN funktion = 0 THEN 4532 --- drop_structure
WHEN funktion = 1 THEN 5344 --- other
WHEN funktion = 2 THEN 4533 --- venting
WHEN funktion = 3 THEN 3267 --- rain_water_manhole
WHEN funktion = 4 THEN 3266 --- gully
WHEN funktion = 5 THEN 3472 --- drainage_channel
WHEN funktion = 6 THEN 228 --- rail_track_gully
WHEN funktion = 7 THEN 5346 --- stormwater_overflow
WHEN funktion = 8 THEN 5344 -- klärgrube --> other
WHEN funktion = 9 THEN 204 --- manhole
WHEN funktion = 10 THEN 1008 --- oil_separator
WHEN funktion = 11 THEN 4536 --- pump_station
WHEN funktion = 12 THEN 2742 --- slurry_collector
WHEN funktion = 13 THEN 5347 --- floating_material_separator
WHEN funktion = 14 THEN 4537 --- jetting_manhole
WHEN funktion = 15 THEN 4798 --- separating_structure
WHEN funktion = 16 THEN 5345 --- unknown
END AS function,
CASE 
WHEN material = 0 THEN 4540 --- other
WHEN material = 1 THEN 4541 --- concrete
WHEN material = 2 THEN 4542 --- plastic
WHEN material = 3 THEN 4543 --- unknown
END AS material,
CASE 
WHEN oberflaechenzulauf = 0 THEN 5342 --- other
WHEN oberflaechenzulauf = 1 THEN 2741 --- none
WHEN oberflaechenzulauf = 2 THEN 2739 --- grid
WHEN oberflaechenzulauf = 3 THEN 5343 --- unknown
WHEN oberflaechenzulauf = 4 THEN 2740 --- intake_from_side
END AS surface_inflow

FROM abwasser.siedlungsentwaesserung__normschacht a_normschacht
LEFT JOIN qgep.od_wastewater_structure  q_wastewater_structure
ON a_normschacht.obj_id = q_wastewater_structure.old_obj_id;
