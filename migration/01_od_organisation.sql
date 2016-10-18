------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalte
ALTER TABLE qgep.od_organisation DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_organisation ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_organisation;

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
-- ACHTUNG auf uid, nach remark entfernt
INSERT INTO qgep.od_organisation
(obj_id, identifier, remark, last_modification)
SELECT
  obj_id,
  bezeichnung,
  bemerkung,
  to_timestamp (LETZTE_AENDERUNG, 'DD MMM YYYY')
FROM abwasser.siedlungsentwaesserung__organisation;


-- 4. update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss fÃ¼r jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema fÃ¼r jede od_xx Tabelle eine Sequenz geben.
-- SELECT setval('qgep.seq_od_organisation_oid', 1, true);
-- UPDATE qgep.od_organisation SET standardoid=qgep.generate_oid('od_organisation');
-- UPDATE qgep.od_organisation SET old_obj_id=obj_id;

UPDATE qgep.od_organisation SET old_obj_id=obj_id;
SELECT setval('qgep.seq_od_organisation_oid', 1, true);
UPDATE qgep.od_organisation SET obj_id=qgep.generate_oid('od_organisation');

