------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_reach_point DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_reach_point ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_reach;
DELETE FROM qgep.od_reach_point;

-- 4. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_reach_point
(elevation_accuracy, identifier, level, outlet_shape, position_of_connection, remark, situation_geometry, last_modification, fk_dataowner, old_obj_id)
SELECT
  CASE WHEN hoehengenauigkeit = 0 THEN 3248 --- more_than_6cm
    WHEN hoehengenauigkeit = 1 THEN 3245 --- plusminus_1cm
    WHEN hoehengenauigkeit = 2 THEN 3246 --- plusminus_3cm
    WHEN hoehengenauigkeit = 3 THEN 3247 --- plusminus_6cm
    WHEN hoehengenauigkeit = 4 THEN 5376 --- unknown
  END,
  bezeichnung,
  kote,
  CASE WHEN auslaufform = 0 THEN 5374 --- round_edged
    WHEN auslaufform = 1 THEN 298 --- orifice
    WHEN auslaufform = 2 THEN 3358 --- no_cross_section_change
    WHEN auslaufform = 3 THEN 286 --- sharp_edged
    WHEN auslaufform = 4 THEN 5375 --- unknown
  END,
  lage_anschluss,
  bemerkung,
  ST_Transform(the_geom, 2056),
  to_timestamp (LETZTE_AENDERUNG, 'DD MM YYYY'),
  org_dataowner.obj_id,
  a_haltungspunkt.obj_id
FROM abwasser.siedlungsentwaesserung__Haltungspunkt a_haltungspunkt
LEFT JOIN qgep.od_organisation org_dataowner ON org_dataowner.identifier = MD_DATENHERR;
