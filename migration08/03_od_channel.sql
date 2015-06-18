------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

------ changes for 08; bedding_encasement.bed_plank doesn't exist; 15.05.15 OS

-- *****************************************
-- function_hierarchic only mapped on pwwf!
-- *****************************************

-- 1. ergaenzen tabelle mit oid spalte
ALTER TABLE qgep.od_channel DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_channel ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten

DELETE FROM qgep.od_channel;

-- Update obj_id wastewater structure
SELECT setval('qgep.seq_od_channel_oid', 1, true);
UPDATE qgep.od_wastewater_structure SET obj_id=qgep.generate_oid('od_channel')
WHERE qgep.od_wastewater_structure.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__Kanal);

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_channel
(obj_id, old_obj_id, bedding_encasement, connection_type, function_hierarchic, function_hydraulic, jetting_interval, pipe_length, usage_current, usage_planned)
SELECT
q_wastewater_structure.obj_id, 
a_kanal.obj_id,
CASE WHEN bettung_umhuellung = 0 THEN 5325 --- other
WHEN bettung_umhuellung = 1 THEN 5332 --- in_soil
WHEN bettung_umhuellung = 2 THEN 5328 --- in_channel_suspended
WHEN bettung_umhuellung = 3 THEN 5339 --- in_channel_concrete_casted
WHEN bettung_umhuellung = 4 THEN 5331 --- in_walk_in_passage
WHEN bettung_umhuellung = 5 THEN 5337 --- in_jacking_pipe_concrete
WHEN bettung_umhuellung = 6 THEN 5336 --- in_jacking_pipe_steel
WHEN bettung_umhuellung = 7 THEN 5335 --- sand
WHEN bettung_umhuellung = 8 THEN 5333 --- sia_type_1
WHEN bettung_umhuellung = 9 THEN 5330 --- sia_type_2
WHEN bettung_umhuellung = 10 THEN 5334 --- sia_type_3
WHEN bettung_umhuellung = 11 THEN 5340 --- sia_type_4
ELSE 5329 --- unknown
END,
CASE WHEN verbindungsart = 0 THEN 5341 --- other
WHEN verbindungsart = 1 THEN 190 --- electric_welded_sleeves
WHEN verbindungsart = 2 THEN 187 --- flat_sleeves
WHEN verbindungsart = 3 THEN 193 --- flange
WHEN verbindungsart = 4 THEN 185 --- bell_shaped_sleeves
WHEN verbindungsart = 5 THEN 192 --- coupling
WHEN verbindungsart = 6 THEN 194 --- screwed_sleeves
WHEN verbindungsart = 7 THEN 189 --- butt_welded
WHEN verbindungsart = 8 THEN 186 --- beaked_sleeves
WHEN verbindungsart = 9 THEN 191 --- push_fit_sleeves
WHEN verbindungsart = 10 THEN 188 --- slip_on_sleeves
WHEN verbindungsart = 12 THEN 3666 --- jacking_pipe_coupling
ELSE 3036 --- unknown
END,
CASE WHEN funktionhierarchisch = 0 THEN 5066 --- pwwf.other
WHEN funktionhierarchisch = 1 THEN 5066 --- pwwf.other Arealentwaesserung
WHEN funktionhierarchisch = 2 THEN 5068 --- pwwf.water_bodies
WHEN funktionhierarchisch = 3 THEN 5069 --- pwwf.main_drain
WHEN funktionhierarchisch = 4 THEN 5070 --- pwwf.main_drain_regional
WHEN funktionhierarchisch = 5 THEN 5064 --- pwwf.residential_drainage
WHEN funktionhierarchisch = 6 THEN 5071 --- pwwf.collector_sewer
WHEN funktionhierarchisch = 7 THEN 5062 --- pwwf.renovation_conduction
WHEN funktionhierarchisch = 8 THEN 5072 --- pwwf.road_drainage
WHEN funktionhierarchisch = 9 THEN 5074 --- pwwf.unknown
END,
CASE WHEN funktionhydraulisch = 0 THEN 5320 --- other
WHEN funktionhydraulisch = 1 THEN 2546 --- drainage_transportation_pipe
WHEN funktionhydraulisch = 2 THEN 22 --- restriction_pipe
WHEN funktionhydraulisch = 3 THEN 3610 --- inverted_syphon
WHEN funktionhydraulisch = 4 THEN 367 --- gravity_pipe
WHEN funktionhydraulisch = 5 THEN 23 --- pump_pressure_pipe
WHEN funktionhydraulisch = 6 THEN 145 --- seepage_water_drain
WHEN funktionhydraulisch = 7 THEN 21 --- retention_pipe
WHEN funktionhydraulisch = 8 THEN 144 --- jetting_pipe
WHEN funktionhydraulisch = 10 THEN 3655 --- vacuum_pipe
ELSE 5321 --- unknown
END,
spuelintervall,
rohrlaenge,
CASE WHEN nutzungsart_ist = 0 THEN 5322 --- other
WHEN nutzungsart_ist = 1 THEN 4518 --- creek_water
WHEN nutzungsart_ist = 2 THEN 4516 --- discharged_combined_wastewater
WHEN nutzungsart_ist = 3 THEN 4524 --- industrial_wastewater
WHEN nutzungsart_ist = 4 THEN 4522 --- combined_wastewater
WHEN nutzungsart_ist = 5 THEN 4520 --- rain_wastewater
WHEN nutzungsart_ist = 6 THEN 4514 --- clean_wastewater
WHEN nutzungsart_ist = 7 THEN 4526 --- wastewater
ELSE 4571 --- unknown
END,
CASE WHEN nutzungsart_geplant = 0 THEN 5323 --- other
WHEN nutzungsart_geplant = 1 THEN 4519 --- creek_water
WHEN nutzungsart_geplant = 2 THEN 4517 --- discharged_combined_wastewater
WHEN nutzungsart_geplant = 3 THEN 4525 --- industrial_wastewater
WHEN nutzungsart_geplant = 4 THEN 4523 --- combined_wastewater
WHEN nutzungsart_geplant = 5 THEN 4521 --- rain_wastewater
WHEN nutzungsart_geplant = 6 THEN 4515 --- clean_wastewater
WHEN nutzungsart_geplant = 7 THEN 4527 --- wastewater
ELSE 4569 --- unknown
END
FROM abwasser.siedlungsentwaesserung__Kanal a_kanal
LEFT JOIN qgep.od_wastewater_structure q_wastewater_structure
ON a_kanal.obj_id = q_wastewater_structure.old_obj_id;


