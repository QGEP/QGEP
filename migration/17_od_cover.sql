------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_cover DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_cover ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_cover;

-- 3. update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
SELECT setval('qgep.seq_od_cover_oid', 1, true);
UPDATE qgep.od_structure_part SET obj_id=qgep.generate_oid('od_cover')
WHERE qgep.od_structure_part.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__Deckel);

-- 4. einsetzen der daten von siedlungsentwaesserung in qgep.

INSERT INTO qgep.od_cover
-- anpassung maechtigkeit
(obj_id, old_obj_id, brand, cover_shape, diameter, fastening, level, material, positional_accuracy, situation_geometry, sludge_bucket, venting)
SELECT 
q_structure_part.obj_id, 
a_deckel.obj_id,
fabrikat,   
CASE 
WHEN deckelform = 0 THEN 5353 --- other
WHEN deckelform = 1 THEN 3499 --- rectangular
WHEN deckelform = 2 THEN 3498 --- round
WHEN deckelform = 3 THEN 5354 --- unknown
END,
durchmesser,
-- CASE WHEN fastening = 0 THEN 5350 --- not_bolted; case weg
CASE
WHEN verschluss = 0 THEN 5350 --- not_bolted
WHEN verschluss = 1 THEN 5351 --- unknown
WHEN verschluss = 2 THEN 5352 --- bolted
END,
kote,
CASE
WHEN material = 0 THEN 5355 --- other
WHEN material = 1 THEN 234 --- concrete
WHEN material = 2 THEN 233 --- cast_iron
WHEN material = 3 THEN 5547 --- cast_iron_with_pavement_filling
WHEN material = 4 THEN 235 --- cast_iron_with_concrete_filling
WHEN material = 5 THEN 3015 --- unknown
END AS material,
CASE
WHEN lagegenauigkeit = 0 THEN 3243 --- more_than_50cm
WHEN lagegenauigkeit = 1 THEN 3241 --- plusminus_10cm
WHEN lagegenauigkeit = 2 THEN 3236 --- plusminus_3cm
WHEN lagegenauigkeit = 3 THEN 3242 --- plusminus_50cm
WHEN lagegenauigkeit = 4 THEN 5349 --- unknown
END,
ST_Transform(the_geom, 2056),
CASE
WHEN schlammeimer = 0 THEN 423 --- inexistent
WHEN schlammeimer = 1 THEN 3066 --- unknown
WHEN schlammeimer = 2 THEN 422 --- existent
END,
CASE
WHEN entlueftung = 0 THEN 229 --- vented
WHEN entlueftung = 1 THEN 230 --- not_vented
WHEN entlueftung = 2 THEN 5348 --- unknown
END

FROM abwasser.siedlungsentwaesserung__Deckel a_deckel
LEFT JOIN qgep.od_structure_part q_structure_part
ON a_deckel.obj_id = q_structure_part.old_obj_id;
