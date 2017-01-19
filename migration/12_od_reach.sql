------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalten
ALTER TABLE qgep.od_reach DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_reach ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_reach;

-- 3. update der oid spalten
-- In Tabelle "qgep.is_dictionary" muss für jede od_xx Tabelle ein Eintrag existieren und es muss im qgep-Schema für jede od_xx Tabelle eine Sequenz geben.
SELECT setval('qgep.seq_od_reach_oid', 1, true);
UPDATE qgep.od_wastewater_networkelement SET obj_id=qgep.generate_oid('od_reach')
WHERE qgep.od_wastewater_networkelement.old_obj_id IN (SELECT obj_id FROM abwasser.siedlungsentwaesserung__Haltung);

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_reach
(obj_id, old_obj_id, clear_height, coefficient_of_friction, 
-- elevation_determination, 
horizontal_positioning, inside_coating, length_effective, material, 
progression_geometry,
-- progression_3d_geometry, reliner_material, reliner_nominal_size, relining_construction, relining_kind, ring_stiffness, slope_building_plan, 
wall_roughness, fk_reach_point_from, fk_reach_point_to, fk_pipe_profile)
SELECT 
q_wastewater_networkelement.obj_id,
a_haltung.obj_id,
lichte_hoehe, reibungsbeiwert, 
-- CASE WHEN hoehenbestimmung = 0 THEN 4780 --- accurate
-- WHEN hoehenbestimmung = 1 THEN 4778 --- unknown
-- WHEN hoehenbestimmung = 2 THEN 4779 --- inaccurate
-- END,
CASE 
WHEN lagebestimmung = 1 THEN 5379 --- unknown
WHEN lagebestimmung = 2 THEN 5380 --- inaccurate
ELSE 5378 --- accurate
END,
CASE 
WHEN innenschutz = 1 THEN 248 --- coating
WHEN innenschutz = 2 THEN 250 --- brick_lining
WHEN innenschutz = 3 THEN 251 --- stoneware_lining
WHEN innenschutz = 4 THEN 5384 --- unknown
WHEN innenschutz = 5 THEN 249 --- cement_mortar_lining
ELSE 5383 --- other
END,
laengeeffektiv, 
CASE WHEN material = 0 THEN 5381 --- other
WHEN material = 1 THEN 2754 --- asbestos_cement
WHEN material = 2 THEN 3638 --- concrete_normal
WHEN material = 3 THEN 3639 --- concrete_insitu
WHEN material = 4 THEN 3640 --- concrete_presspipe
WHEN material = 5 THEN 3641 --- concrete_special
WHEN material = 6 THEN 3256 --- concrete_unknown
WHEN material = 7 THEN 147 --- fiber_cement
WHEN material = 8 THEN 2755 --- bricks
WHEN material = 9 THEN 148 --- cast_ductile_iron
WHEN material = 10 THEN 3648 --- cast_gray_iron
WHEN material = 11 THEN 5076 --- plastic_epoxy_resin
WHEN material = 12 THEN 5077 --- plastic_highdensity_polyethylene
WHEN material = 13 THEN 5078 --- plastic_polyester_GUP
WHEN material = 14 THEN 5079 --- plastic_polyethylene
WHEN material = 15 THEN 5080 --- plastic_polypropylene
WHEN material = 16 THEN 5081 --- plastic_PVC
WHEN material = 17 THEN 5382 --- plastic_unknown
WHEN material = 18 THEN 153 --- steel
WHEN material = 19 THEN 3654 --- steel_stainless
WHEN material = 20 THEN 154 --- stoneware
WHEN material = 21 THEN 2761 --- clay
WHEN material = 23 THEN 2762 --- cement
ELSE 3016 --- unknown
END,
ST_Force3D(ST_ForceCurve( ST_RemoveRepeatedPoints( ST_GeometryN( a_haltung.the_geom, 1 ) ) ) ), -- Convert single-part multilinestring to linestring by extracting the first (and only) part
-- verlauf, 
-- the_geom3D,  
-- CASE WHEN reliner_material = 0 THEN 6459 --- other WHEN reliner_material = 1 THEN 6461 --- epoxy_resin_glass_fibre_laminate WHEN reliner_material = 2 THEN 6460 --- epoxy_resin_plastic_felt WHEN reliner_material = 3 THEN 6483 --- GUP_pipe WHEN reliner_material = 4 THEN 6462 --- HDPE WHEN reliner_material = 5 THEN 6484 --- isocyanate_resin_glass_fibre_laminate WHEN reliner_material = 6 THEN 6485 --- isocyanate_resin_plastic_felt WHEN reliner_material = 7 THEN 6464 --- polyester_resin_glass_fibre_laminate WHEN reliner_material = 8 THEN 6463 --- polyester_resin_plastic_felt WHEN reliner_material = 9 THEN 6482 --- polypropylene WHEN reliner_material = 10 THEN 6465 --- PVC WHEN reliner_material = 11 THEN 6466 --- bottom_with_polyester_concret_shell WHEN reliner_material = 12 THEN 6467 --- unknown WHEN reliner_material = 13 THEN 6486 --- UP_resin_LED_synthetic_fibre_liner WHEN reliner_material = 14 THEN 6468 --- vinyl_ester_resin_glass_fibre_laminate WHEN reliner_material = 15 THEN 6469 --- vinyl_ester_resin_plastic_felt END,
-- reliner_nennweite,
-- CASE WHEN reliner_bautechnik = 0 THEN 6448 --- other WHEN reliner_bautechnik = 1 THEN 6479 --- close_fit_relining WHEN reliner_bautechnik = 2 THEN 6449 --- relining_short_tube WHEN reliner_bautechnik = 3 THEN 6481 --- grouted_in_place_lining WHEN reliner_bautechnik = 4 THEN 6452 --- partial_liner WHEN reliner_bautechnik = 5 THEN 6450 --- pipe_string_relining WHEN reliner_bautechnik = 6 THEN 6451 --- hose_relining WHEN reliner_bautechnik = 7 THEN 6453 --- unknown WHEN reliner_bautechnik = 8 THEN 6480 --- spiral_lining END,
-- CASE WHEN reliner_art = 0 THEN 6455 --- full_reach  WHEN relining_art = 1 THEN 6456 --- partial  WHEN relining_art = 2 THEN 6457 --- unknown END,
-- ringsteifigkeit, 
-- plangefaelle,
wandrauhigkeit,
q_reach_point_from.obj_id,
q_reach_point_to.obj_id,
q_pipe_profile.obj_id
FROM abwasser.siedlungsentwaesserung__Haltung a_haltung
LEFT JOIN qgep.od_wastewater_networkelement q_wastewater_networkelement
ON q_wastewater_networkelement.old_obj_id = a_haltung.obj_id
LEFT JOIN qgep.od_reach_point q_reach_point_from
ON q_reach_point_from.old_obj_id = a_haltung.vonhaltungspunkt
LEFT JOIN qgep.od_reach_point q_reach_point_to
ON q_reach_point_to.old_obj_id = a_haltung.nachhaltungspunkt
LEFT JOIN qgep.od_pipe_profile q_pipe_profile
ON q_pipe_profile.old_obj_id = a_haltung.rohrprofil;
