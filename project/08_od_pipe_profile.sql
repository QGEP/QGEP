------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_pipe_profile DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_pipe_profile ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_pipe_profile;

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_pipe_profile
(obj_id, height_width_ratio, identifier, profile_type, remark, last_modification, fk_dataowner)
SELECT a_rohrprofil.obj_id, hoehenbreitenverhaeltnis, bezeichnung,
CASE WHEN profiltyp = 0 THEN 5377 --- other
  WHEN profiltyp = 1 THEN 3351 --- egg
  WHEN profiltyp = 2 THEN 3350 --- circle
  WHEN profiltyp = 3 THEN 3352 --- mouth
  WHEN profiltyp = 4 THEN 3354 --- open
  WHEN profiltyp = 5 THEN 3353 --- rectangular
  WHEN profiltyp = 6 THEN 3355 --- special
  WHEN profiltyp = 7 THEN 3357 --- unknown
END,
bemerkung,
to_timestamp (LETZTE_AENDERUNG, 'DD MMM YYYY'),
org_dataowner.obj_id
FROM abwasser.siedlungsentwaesserung__Rohrprofil a_rohrprofil
LEFT JOIN qgep.od_organisation org_dataowner ON org_dataowner.identifier = MD_DATENHERR;



-- 4. update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
UPDATE qgep.od_pipe_profile SET old_obj_id=obj_id;
SELECT setval('qgep.seq_od_pipe_profile_oid', 1, true);
UPDATE qgep.od_pipe_profile SET obj_id=qgep.generate_oid('od_pipe_profile');
