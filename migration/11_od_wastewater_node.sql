------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_wastewater_node DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_wastewater_node ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_wastewater_node;

-- 3. update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
SELECT setval('qgep.seq_od_wastewater_node_oid', 1, true);
UPDATE qgep.od_wastewater_networkelement SET obj_id=qgep.generate_oid('od_wastewater_node')
WHERE qgep.od_wastewater_networkelement.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__abwasserknoten);

-- 4. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_wastewater_node
(
  obj_id,
  old_obj_id, 
  backflow_level, 
  bottom_level, 
  situation_geometry
) 
SELECT
  q_wastewater_networkelement.obj_id,
  a_abwasserknoten.obj_id,
  rueckstaukote,
  sohlenkote,
  ST_Transform(the_geom, 2056)
FROM abwasser.siedlungsentwaesserung__abwasserknoten a_abwasserknoten
  LEFT JOIN qgep.od_wastewater_networkelement q_wastewater_networkelement
  ON q_wastewater_networkelement.old_obj_id = a_abwasserknoten.obj_id;
