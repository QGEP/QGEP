-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
-------
DELETE FROM qgep.od_organisation;
DELETE FROM qgep.od_structure_part;
DELETE FROM qgep.od_pipe_profile;
DELETE FROM qgep.od_wastewater_networkelement;
DELETE FROM qgep.od_wastewater_structure;
DELETE FROM qgep.od_reach_point;
DELETE FROM qgep.od_benching;
DELETE FROM qgep.od_cover;
DELETE FROM qgep.od_access_aid;
DELETE FROM qgep.od_dryweather_flume;
DELETE FROM qgep.od_discharge_point;
DELETE FROM qgep.od_infiltration_installation;
DELETE FROM qgep.od_manhole;
DELETE FROM qgep.od_channel;
DELETE FROM qgep.od_special_structure;
DELETE FROM qgep.od_reach;
DELETE FROM qgep.od_wastewater_node;

INSERT INTO qgep.od_organisation
(obj_id, identifier, remark, Datenherr) 
SELECT obj_id, bezeichnung, bemerkung, MD_DATENHERR 
FROM abwasser.siedlungsentwaesserung__organisation;
--done - todo: translate datenherr/datenlieferant

INSERT INTO qgep.od_wastewater_structure
(obj_id, accessibility, contract_section, detail_geometry_geometry, disposition_state, gross_costs, identifier, inspection_interval, location_name, remark, renovation_demand, structure_condition, subsidies, year_of_construction, year_of_replacement, datenherr) 
SELECT bw.obj_id, 
 CASE WHEN bw.zugaenglichkeit = 0 THEN 3444 --- covered
  WHEN bw.zugaenglichkeit = 1 THEN 3447 --- unknown
  WHEN bw.zugaenglichkeit = 2 THEN 3446 --- inaccessible
  WHEN bw.zugaenglichkeit = 3 THEN 3445 --- accessible
 END AS accessibility,
 bw.baulos, geom.the_geom,
 CASE WHEN bw.status = 0 THEN 7 --- suspended_not_filled
  WHEN bw.status = 1 THEN 3325 --- suspended_unknown
  WHEN bw.status = 2 THEN 3633 --- nonoperational
  WHEN bw.status = 3 THEN 2763 --- calculation_alternative
  WHEN bw.status = 4 THEN 2764 --- planned
  WHEN bw.status = 5 THEN 3634 --- operational
  WHEN bw.status = 6 THEN 3653 --- project
  WHEN bw.status = 7 THEN 10 --- tentative
  WHEN bw.status = 8 THEN 3027 --- unknown
  WHEN bw.status = 9 THEN 8 --- filled
  WHEN bw.status = 10 THEN 2683 --- will_be_suspended
 END AS disposition_state,
 bw.bruttokosten, bw.bezeichnung, bw.inspektionsintervall, bw.standortname, bw.bemerkung,
 CASE WHEN bw.sanierungsbedarf = 0 THEN 1 --- urgent
  WHEN bw.sanierungsbedarf = 1 THEN 5 --- no
  WHEN bw.sanierungsbedarf = 2 THEN 2 --- short_term
  WHEN bw.sanierungsbedarf = 3 THEN 4 --- long_term
  WHEN bw.sanierungsbedarf = 4 THEN 3 --- medium_term
  WHEN bw.sanierungsbedarf = 5 THEN 3023 --- unknown
 END AS renovation_demand,
 CASE WHEN bw.baulicherzustand = 0 THEN 3037 --- unknown
  WHEN bw.baulicherzustand = 1 THEN 3363 --- Z0
  WHEN bw.baulicherzustand = 2 THEN 3359 --- Z1
  WHEN bw.baulicherzustand = 3 THEN 3360 --- Z2
  WHEN bw.baulicherzustand = 4 THEN 3361 --- Z3
  WHEN bw.baulicherzustand = 5 THEN 3362 --- Z4
 END AS structure_condition,
 bw.subventionen, bw.baujahr, bw.ersatzjahr, bw.md_datenherr
FROM abwasser.siedlungsentwaesserung__Abwasserbauwerk bw
LEFT JOIN abwasser.siedlungsentwaesserung__abwasserbauwerk_detailgeometrie geom ON bw.obj_id = geom._tid AND geom.the_geom IS NOT NULL --later this has to be connected to ref_tid
;
--done, todo: letzte_aenderung/last_modification cast into correct date
--todo: translate datenherr/datenlieferant

INSERT INTO qgep.od_structure_part
(
obj_id, identifier, remark, renovation_demand, datenherr, fs_wastewater_structure) 
SELECT obj_id, bezeichnung, bemerkung, 
 CASE WHEN instandstellung = 0 THEN 138 --- not_necessary
  WHEN instandstellung = 1 THEN 137 --- necessary
  WHEN instandstellung = 2 THEN 3042 --- unknown
 END AS renovation_demand, md_datenherr, abwasserbauwerk
FROM abwasser.siedlungsentwaesserung__BauwerksTeil;
--done, todo: letzte_aenderung/last_modification cast into correct date
--todo: translate datenherr/datenlieferant

INSERT INTO qgep.od_pipe_profile
(obj_id, height_width_ratio, identifier, profile_type, remark, datenherr) 
SELECT obj_id, hoehenbreitenverhaeltnis, bezeichnung, 
 CASE WHEN profiltyp = 0 THEN 3356 --- other
  WHEN profiltyp = 1 THEN 3351 --- egg_profile
  WHEN profiltyp = 2 THEN 3350 --- circular_profile
  WHEN profiltyp = 3 THEN 3352 --- mouth_profile
  WHEN profiltyp = 4 THEN 3354 --- open_profile
  WHEN profiltyp = 5 THEN 3353 --- rectangular_profile
  WHEN profiltyp = 6 THEN 3355 --- special_profile
  WHEN profiltyp = 7 THEN 3357 --- unknown
  END AS profile_type,
  bemerkung, md_datenherr
FROM abwasser.siedlungsentwaesserung__rohrprofil;
--done, todo: letzte_aenderung/last_modification cast into correct date
--todo: translate datenherr/datenlieferant

INSERT INTO qgep.od_wastewater_networkelement
(obj_id, identifier, remark, datenherr, fs_wastewater_structure) 
SELECT obj_id, bezeichnung, bemerkung, md_datenherr, abwasserbauwerk 
 FROM abwasser.siedlungsentwaesserung__abwassernetzelement;
--done, todo: letzte_aenderung/last_modification cast into correct date
--todo: translate datenherr/datenlieferant

INSERT INTO qgep.od_reach_point
(obj_id, elevation_accuracy, identifier, level, outlet_shape, position_of_connection, remark, situation_geometry, datenherr, fs_wastewater_networkelement) 
SELECT obj_id, 
 CASE WHEN hoehengenauigkeit = 0 THEN 3248 --- more_than_6cm
  WHEN hoehengenauigkeit = 1 THEN 3245 --- plusminus_1cm
  WHEN hoehengenauigkeit = 2 THEN 3246 --- plusminus_3cm
  WHEN hoehengenauigkeit = 3 THEN 3247 --- plusminus_6cm
  WHEN hoehengenauigkeit = 4 THEN 3327 --- unknown
 END AS elevation_accuracy,
 bezeichnung, kote, 
 CASE WHEN auslaufform = 0 THEN 285 --- round_edged
  WHEN auslaufform = 1 THEN 298 --- orifice
  WHEN auslaufform = 2 THEN 3358 --- no_cross_section_change
  WHEN auslaufform = 3 THEN 286 --- sharp_edged
  WHEN auslaufform = 4 THEN 3074 --- unknown
 END AS outlet_shape,
 lage_anschluss::smallint, bemerkung, the_geom, md_datenherr, abwassernetzelement
FROM abwasser.siedlungsentwaesserung__haltungspunkt;
--done, todo: letzte_aenderung/last_modification cast into correct date
--todo: translate datenherr/datenlieferant

INSERT INTO qgep.od_benching
(obj_id, type) 
SELECT obj_id,
 CASE WHEN art = 0 THEN 3211 --- other
  WHEN art = 1 THEN 94 --- double_sided
  WHEN art = 2 THEN 93 --- onesided
  WHEN art = 3 THEN 3231 --- no
  WHEN art = 4 THEN 3033 --- unknown
 END AS type
FROM abwasser.siedlungsentwaesserung__Bankett;
--done, not in use in Arbon

INSERT INTO qgep.od_cover
(obj_id, brand, cover_shape, diameter, fastening, level, location_accuracy, material, situation_geometry, sludge_bucket, venting)
SELECT obj_id, fabrikat, 
 CASE WHEN deckelform = 0 THEN 3500 --- other
  WHEN deckelform = 1 THEN 3499 --- rectangular
  WHEN deckelform = 2 THEN 3498 --- round
  WHEN deckelform = 3 THEN 3501 --- unknown
 END AS cover_shape,
 durchmesser, 
 CASE WHEN verschluss = 0 THEN 175 --- not_bolted
  WHEN verschluss = 1 THEN 3090 --- unknown
  WHEN verschluss = 2 THEN 174 --- bolted
 END AS fastening,
 kote, 
 CASE WHEN lagegenauigkeit = 0 THEN 3243 --- more_than_50cm
  WHEN lagegenauigkeit = 1 THEN 3241 --- plusminus_10cm
  WHEN lagegenauigkeit = 2 THEN 3236 --- plusminus_3cm
  WHEN lagegenauigkeit = 3 THEN 3242 --- plusminus_50cm
  WHEN lagegenauigkeit = 4 THEN 3326 --- unknown
 END AS location_accuracy,
 CASE WHEN material = 0 THEN 2976 --- other
  WHEN material = 1 THEN 234 --- concrete
  WHEN material = 2 THEN 233 --- cast_iron
  WHEN material = 3 THEN 236 --- cast_iron_with_pavement_filling
  WHEN material = 4 THEN 235 --- cast_iron_with_conrete_filling
  WHEN material = 5 THEN 3015 --- unknown
 END AS material,
 the_geom, 
 CASE WHEN schlammeimer = 0 THEN 423 --- inexistent
  WHEN schlammeimer = 1 THEN 3066 --- unknown
  WHEN schlammeimer = 2 THEN 422 --- existent
  END AS sludge_bucket,
  CASE WHEN entlueftung = 0 THEN 229 --- vented
   WHEN entlueftung = 1 THEN 230 --- not_vented
   WHEN entlueftung = 2 THEN 3092 --- unknown
  END AS venting
FROM abwasser.siedlungsentwaesserung__deckel;
--done

INSERT INTO qgep.od_access_aid
(obj_id, type)
SELECT obj_id,
 CASE WHEN art = 0 THEN 2977 --- other
  WHEN art = 1 THEN 243 --- pressurized_door
  WHEN art = 2 THEN 92 --- none
  WHEN art = 3 THEN 240 --- ladder
  WHEN art = 4 THEN 241 --- step_iron
  WHEN art = 5 THEN 3473 --- staircase
  WHEN art = 6 THEN 91 --- footstep_niches
  WHEN art = 7 THEN 3230 --- door
  WHEN art = 8 THEN 3048 --- unknown
 END AS type
FROM abwasser.siedlungsentwaesserung__einstiegshilfe;
--done

INSERT INTO qgep.od_dryweather_flume
(obj_id, material)
SELECT obj_id, 
 CASE WHEN material = 0 THEN 3221 --- other
  WHEN material = 1 THEN 354 --- combined
  WHEN material = 2 THEN 239 --- plastic
  WHEN material = 3 THEN 238 --- stoneware
  WHEN material = 4 THEN 3017 --- unknown
  WHEN material = 5 THEN 237 --- cement_mortar
 END AS material
FROM abwasser.siedlungsentwaesserung__trockenwetterrinne;
--done

--INSERT INTO qgep.od_discharge_point
--(obj_id, highwater_level)
--SELECT obj_id, hochwasserkote
--FROM abwasser.siedlungsentwaesserung__einleitstelle;
--nicht gefunden

INSERT INTO qgep.od_infiltration_installation
(obj_id, absorption_capacity, defects, dimension1, dimension2, distance_to_aquifer, effective_area, emergency_spillway, labeling, seepage_utilization, type, vehicle_access, watertightness) 
SELECT obj_id, schluckvermoegen,
 CASE WHEN maengel = 0 THEN 3274 --- none
  WHEN maengel = 1 THEN 3276 --- marginal
  WHEN maengel = 2 THEN 3275 --- substantial
 END AS defects,
 dimension1, dimension2, gwdistanz, wirksameflaeche, 
 CASE WHEN notueberlauf = 0 THEN 3306 --- in_combined_waste_water_drain
  WHEN notueberlauf = 1 THEN 3307 --- in_rain_waste_water_drain
  WHEN notueberlauf = 2 THEN 3304 --- in_water_body
  WHEN notueberlauf = 3 THEN 3303 --- none
  WHEN notueberlauf = 4 THEN 3305 --- surface_discharge
  WHEN notueberlauf = 5 THEN 3308 --- unknown
 END AS emergency_spillway,
 CASE WHEN beschriftung = 0 THEN 3328 --- labeled
  WHEN beschriftung = 1 THEN 3329 --- not_labeled
  WHEN beschriftung = 2 THEN 3330 --- unknown
 END AS labeling,
 CASE WHEN versickerungswasser = 0 THEN 274 --- rain_water
  WHEN versickerungswasser = 1 THEN 273 --- clean_water
  WHEN versickerungswasser = 2 THEN 3086 --- unknown
 END AS seepage_utilization,
 CASE WHEN art = 0 THEN 3282 --- with_soil_passage
  WHEN art = 1 THEN 3285 --- without_soil_passage
  WHEN art = 2 THEN 3279 --- surface_percolation
  WHEN art = 3 THEN 277 --- gravel_formation
  WHEN art = 4 THEN 3284 --- combination_manhole_pipe
  WHEN art = 5 THEN 3281 --- depression_percolation
  WHEN art = 6 THEN 3087 --- unknown
  WHEN art = 7 THEN 3280 --- percolation_over_the_shoulder
  WHEN art = 8 THEN 276 --- percolation_basin
  WHEN art = 9 THEN 278 --- percolation_manhole
  WHEN art = 10 THEN 3283 --- percolation_gallery
 END AS type,
 CASE WHEN saugwagen = 0 THEN 3289 --- unknown
  WHEN saugwagen = 1 THEN 3288 --- inaccessible
  WHEN saugwagen = 2 THEN 3287 --- accessible
 END AS vehicle_access,
 CASE WHEN wasserdichtheit = 0 THEN 3295 --- not_watertight
  WHEN wasserdichtheit = 1 THEN 3296 --- unknown
  WHEN wasserdichtheit = 2 THEN 3294 --- watertight
 END AS watertightness
FROM abwasser.siedlungsentwaesserung__Versickerungsanlage;
--done - not in use in Arbon

INSERT INTO qgep.od_manhole
(obj_id, dimension1, dimension2, function, material, surface_inflow)
SELECT obj_id, dimension1, dimension2,
 CASE WHEN funktion = 0 THEN 4532 --- drop_structure
  WHEN funktion = 1 THEN 2989 --- other
  WHEN funktion = 2 THEN 4533 --- venting
  WHEN funktion = 3 THEN 3267 --- rain_water_manhole
  WHEN funktion = 4 THEN 3266 --- gully
  WHEN funktion = 5 THEN 3472 --- drainage_channel
  WHEN funktion = 6 THEN 228 --- rail_track_gully
  WHEN funktion = 7 THEN 4534 --- spill_way
  WHEN funktion = 8 THEN 4535 --- septic_tank
  WHEN funktion = 9 THEN 204 --- manhole
  WHEN funktion = 10 THEN 1008 --- oil_separator
  WHEN funktion = 11 THEN 4536 --- pump_station
  WHEN funktion = 12 THEN 2742 --- slurry_collector
  WHEN funktion = 13 THEN 3332 --- floating_material_separator
  WHEN funktion = 14 THEN 4537 --- jetting_manhole
  WHEN funktion = 15 THEN 4538 --- 
  WHEN funktion = 16 THEN 3006 --- unknown
 END AS function,
 CASE WHEN material = 0 THEN 4540 --- other
  WHEN material = 1 THEN 4541 --- concrete
  WHEN material = 2 THEN 4542 --- plastic
  WHEN material = 3 THEN 4543 --- unknown
 END AS material,
 CASE WHEN oberflaechenzulauf = 0 THEN 3218 --- other
  WHEN oberflaechenzulauf = 1 THEN 2741 --- no
  WHEN oberflaechenzulauf = 2 THEN 2739 --- grid
  WHEN oberflaechenzulauf = 3 THEN 3062 --- unknown
  WHEN oberflaechenzulauf = 4 THEN 2740 --- intake_from_side
 END AS surface_inflow
FROM abwasser.siedlungsentwaesserung__Normschacht;
--done

INSERT INTO qgep.od_channel
(obj_id, bedding_encasement, connection_type, function_hierarchic, function_hydraulic, jetting_interval, pipe_length, usage_current, usage_planned)
SELECT obj_id, 
 CASE WHEN bettung_umhuellung = 0 THEN 5329 --- andere --> unbekannt
  WHEN bettung_umhuellung = 1 THEN 5332 --in_soil/erdverlegt
  WHEN bettung_umhuellung = 2 THEN 5328 --in_channel_suspended/in_Kanal_aufgehaengt
  WHEN bettung_umhuellung = 3 THEN 5339 --in_channel_concrete_casted/in_Kanal_einbetoniert
  WHEN bettung_umhuellung = 4 THEN 5331 --in_walk_in_passage/in_Leitungsgang
  WHEN bettung_umhuellung = 5 THEN 5337 --in_jacking_pipe_concrete/in_Vortriebsrohr_Beton
  WHEN bettung_umhuellung = 6 THEN 5336 --in_jacking_pipe_steel/in_Vortriebsrohr_Stahl
  WHEN bettung_umhuellung = 7 THEN 5335 --sand/sand
  WHEN bettung_umhuellung = 8 THEN 5333 --SIA_type_1
  WHEN bettung_umhuellung = 9 THEN 5330 --SIA_type_2
  WHEN bettung_umhuellung = 10 THEN 5334 --SIA_type_3
  WHEN bettung_umhuellung = 11 THEN 5340 --SIA_type_4
  WHEN bettung_umhuellung = 12 THEN 5329 --unknown/unbekannt
 END AS bedding_encasement,
 CASE WHEN verbindungsart = 0 THEN 2988 --- other
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
  WHEN verbindungsart = 11 THEN 3036 --- unknown
  WHEN verbindungsart = 12 THEN 3666 --- jacking_pipe_coupling
 END AS connection_type,
 CASE WHEN funktionhierarchisch = 0 THEN 2987 --- other
  WHEN funktionhierarchisch = 1 THEN 3249 --- surface_drainage
  WHEN funktionhierarchisch = 2 THEN 3251 --- water_bodies
  WHEN funktionhierarchisch = 3 THEN 19 --- main_drain
  WHEN funktionhierarchisch = 4 THEN 3672 --- main_drain_regional
  WHEN funktionhierarchisch = 5 THEN 3252 --- residential_drainage
  WHEN funktionhierarchisch = 6 THEN 20 --- collector_sewer
  WHEN funktionhierarchisch = 7 THEN 2743 --- renovation_conduction
  WHEN funktionhierarchisch = 8 THEN 3250 --- road_drainage
  WHEN funktionhierarchisch = 9 THEN 3011 --- unknown
 END AS function_hierarchic,
 CASE WHEN funktionhydraulisch = 0 THEN 3214 --- other
  WHEN funktionhydraulisch = 1 THEN 2546 --- drainage_transportation_pipe
  WHEN funktionhydraulisch = 2 THEN 22 --- restriction_pipe
  WHEN funktionhydraulisch = 3 THEN 3610 --- inverted_syphon
  WHEN funktionhydraulisch = 4 THEN 367 --- gravity_pipe
  WHEN funktionhydraulisch = 5 THEN 23 --- pump_pressure_pipe
  WHEN funktionhydraulisch = 6 THEN 145 --- seepage_water_drain
  WHEN funktionhydraulisch = 7 THEN 21 --- retention_pipe
  WHEN funktionhydraulisch = 8 THEN 144 --- jetting_pipe
  WHEN funktionhydraulisch = 9 THEN 3012 --- unknown
  WHEN funktionhydraulisch = 10 THEN 3655 --- vacuum_pipe
 END AS function_hydraulic,
 spuelintervall, rohrlaenge,
 CASE WHEN nutzungsart_ist = 0 THEN 4570 --- other
  WHEN nutzungsart_ist = 1 THEN 4518 --- creek_water
  WHEN nutzungsart_ist = 2 THEN 4516 --- discharged_wastewater
  WHEN nutzungsart_ist = 3 THEN 4524 --- industrial_wastewater
  WHEN nutzungsart_ist = 4 THEN 4522 --- combined_wastewater
  WHEN nutzungsart_ist = 5 THEN 4520 --- rain_wastewater
  WHEN nutzungsart_ist = 6 THEN 4514 --- clean_wastewater
  WHEN nutzungsart_ist = 7 THEN 4526 --- wastewater
  WHEN nutzungsart_ist = 8 THEN 4571 --- unknown
 END AS usage_current,
 CASE WHEN nutzungsart_geplant = 0 THEN 4568 --- other
  WHEN nutzungsart_geplant = 1 THEN 4519 --- creek_water
  WHEN nutzungsart_geplant = 2 THEN 4517 --- discharged_combined_wastewater
  WHEN nutzungsart_geplant = 3 THEN 4525 --- industrial_wastewater
  WHEN nutzungsart_geplant = 4 THEN 4523 --- combined_wastewater
  WHEN nutzungsart_geplant = 5 THEN 4521 --- rain_wastewater
  WHEN nutzungsart_geplant = 6 THEN 4515 --- clean_wastewater
  WHEN nutzungsart_geplant = 7 THEN 4527 --- wastewater
  WHEN nutzungsart_geplant = 8 THEN 4569 --- unknown
 END AS usage_planned
FROM abwasser.siedlungsentwaesserung__kanal;
--done.

INSERT INTO qgep.od_special_structure
(obj_id, bypass, function)
SELECT obj_id, 
 CASE WHEN bypass = 0 THEN 2682 --- inexistent
  WHEN bypass = 1 THEN 3055 --- unknown
  WHEN bypass = 2 THEN 2681 --- existent
 END AS bypass,
 CASE WHEN funktion = 0 THEN 245 --- drop_structure
  WHEN funktion = 1 THEN 3202 --- other
  WHEN funktion = 2 THEN 386 --- venting
  WHEN funktion = 3 THEN 3234 --- inverse_syphon_chamber
  WHEN funktion = 4 THEN 3348 --- terrain_depression
  WHEN funktion = 5 THEN 336 --- bolders_bedload_catchement_dam
  WHEN funktion = 6 THEN 3233 --- spill_way
  WHEN funktion = 7 THEN 2744 --- cesspit
  WHEN funktion = 8 THEN 247 --- septic_tank
  WHEN funktion = 9 THEN 2998 --- manhole
  WHEN funktion = 10 THEN 2768 --- oil_separator
  WHEN funktion = 11 THEN 246 --- pump_station
  WHEN funktion = 12 THEN 3673 --- stormwater_tank_with_overflow
  WHEN funktion = 13 THEN 3674 --- stormwater_tank_retaining_first_flush
  WHEN funktion = 14 THEN 3675 --- stormwater_sedimentation_tank
  WHEN funktion = 15 THEN 3676 --- stormwater_retention_tank
  WHEN funktion = 16 THEN 3677 --- stormwater_composite_tank
  WHEN funktion = 17 THEN 3331 --- floating_material_separator
  WHEN funktion = 18 THEN 383 --- side_access
  WHEN funktion = 19 THEN 227 --- jetting_manhole
  WHEN funktion = 20 THEN 96 --- seperating_manhole
  WHEN funktion = 21 THEN 3008 --- unknown
  WHEN funktion = 22 THEN 2745 --- vortex_manhole
 END AS function
FROM abwasser.siedlungsentwaesserung__spezialbauwerk;
--done

INSERT INTO qgep.od_reach
(obj_id, coefficient_of_friction, depth, horizontal_positioning, inside_coating, length_effective, material, progression, wall_roughness, fs_reach_point_from, fs_reach_point_to, fs_pipe_profile)
SELECT obj_id, reibungsbeiwert, lichte_hoehe,
 CASE WHEN lagebestimmung = 0 THEN 3630 --- accurate
  WHEN lagebestimmung = 1 THEN 3632 --- unknown
  WHEN lagebestimmung = 2 THEN 3631 --- inaccurate
 END AS horizontal_positioning,
 CASE WHEN innenschutz = 0 THEN 2984 --- other
  WHEN innenschutz = 1 THEN 248 --- coating
  WHEN innenschutz = 2 THEN 250 --- brick_lining
  WHEN innenschutz = 3 THEN 251 --- stoneware_lining
  WHEN innenschutz = 4 THEN 3044 --- unknown
  WHEN innenschutz = 5 THEN 249 --- cement_mortar_lining
 END AS inside_coating,
 laengeeffektiv, 
 CASE WHEN material = 0 THEN 2985 --- other
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
  WHEN material = 11 THEN 3642 --- plastic_epoxy_resin
  WHEN material = 12 THEN 3643 --- plastic_highdensity_polyethylene
  WHEN material = 13 THEN 3644 --- plastic_polyester_GUP
  WHEN material = 14 THEN 3645 --- plastic_polyethylene
  WHEN material = 15 THEN 3646 --- plastic_polypropylene
  WHEN material = 16 THEN 3647 --- plastic_PVC
  WHEN material = 17 THEN 3258 --- plastic_unknown
  WHEN material = 18 THEN 153 --- steel
  WHEN material = 19 THEN 3654 --- steel_stainless
  WHEN material = 20 THEN 154 --- stoneware
  WHEN material = 21 THEN 2761 --- clay
  WHEN material = 22 THEN 3016 --- unknown
  WHEN material = 23 THEN 2762 --- cement
 END AS material,
 the_geom, wandrauhigkeit, vonhaltungspunkt, nachhaltungspunkt, rohrprofil
FROM abwasser.siedlungsentwaesserung__haltung;
--done todo: lichte_hoehe, clear_height missing?, pipe_profile has to be checked/added

INSERT INTO qgep.od_wastewater_node
(obj_id, backflow_level, bottom_level, situation_geometry)
SELECT obj_id, rueckstaukote, sohlenkote, the_geom
FROM abwasser.siedlungsentwaesserung__abwasserknoten;
--done

