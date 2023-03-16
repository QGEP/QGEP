------ 26.0814: for development only, uses table ezg in schema public
------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

------ changes for 08; lots of changes; matched kind and status as good as possible; manually correction necessary!!; 04.06.15 OS

------ ****************************************************************************************************
------ art = 4 (unbekannt) doesn't exist anymore and therefore it needs to be manually corrected beforehand

-- 1. ergaenzen tabelle mit oid spalte
ALTER TABLE qgep.od_catchment_area DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_catchment_area ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_catchment_area;


--- ergaenzen mit status und art (nur für import)
ALTER TABLE qgep.od_catchment_area ADD COLUMN old_art smallint;
ALTER TABLE qgep.od_catchment_area ADD COLUMN old_status smallint;

--- import
INSERT INTO qgep.od_catchment_area
(obj_id,
-- direct_discharge_current,
-- direct_discharge_planned,
discharge_coefficient_rw_current,
--discharge_coefficient_rw_planned,
-- discharge_coefficient_ww_current,
-- discharge_coefficient_ww_planned,
--- drainage_system_current,
-- drainage_system_planned,
identifier,
-- infiltration_current,
-- infiltration_planned,
perimeter_geometry,
-- population_density_current,
-- population_density_planned,
remark,
-- retention_current,
-- retention_planned,
-- runoff_limit_current,
-- runoff_limit_planned,
-- seal_factor_rw_current,
-- seal_factor_rw_planned,
-- seal_factor_ww_current,
-- seal_factor_ww_planned,
-- sewer_infiltration_water_production_current,
-- sewer_infiltration_water_production_planned,
surface_area,
-- waste_water_production_current,
-- waste_water_production_planned,
-- last_modification,
-- dataowner
fk_wastewater_networkelement_rw_current,
--fk_wastewater_networkelement_rw_planned,
old_art,
old_status
)
SELECT
a_ezg.obj_id,
abflussbeiwert,
bezeichnung,
ST_Transform(ST_ForceCurve(ST_MakePolygon( ST_GeometryN( the_geom, 1 ) ) ), 2056),
bemerkung,
ST_Area(ST_GeometryN( the_geom, 1 ))/1000, -- m^2 zu ha
q_wastewater_networkelement.obj_id,
art,
status
FROM abwasser.siedlungsentwaesserung__einzugsgebiet a_ezg
LEFT JOIN qgep.od_wastewater_networkelement q_wastewater_networkelement
on a_ezg.abwassernetzelement = q_wastewater_networkelement.old_obj_id;


--- zuordung nach ist/plan
UPDATE qgep.od_catchment_area SET discharge_coefficient_rw_current = discharge_coefficient_rw_planned, fk_wastewater_networkelement_rw_current = fk_wastewater_networkelement_rw_planned WHERE old_status=0;
UPDATE qgep.od_catchment_area SET discharge_coefficient_rw_planned = discharge_coefficient_rw_current, discharge_coefficient_rw_current= DEFAULT, fk_wastewater_networkelement_rw_planned = fk_wastewater_networkelement_rw_current, fk_wastewater_networkelement_rw_current = DEFAULT WHERE old_status=2;
--- zuordnung nach regen/trockenwetter
UPDATE qgep.od_catchment_area SET discharge_coefficient_rw_current = discharge_coefficient_ww_current, fk_wastewater_networkelement_rw_current = fk_wastewater_networkelement_ww_current, discharge_coefficient_rw_planned = discharge_coefficient_ww_planned WHERE old_art=0;
UPDATE qgep.od_catchment_area SET discharge_coefficient_ww_current = discharge_coefficient_rw_current, discharge_coefficient_rw_current = DEFAULT, fk_wastewater_networkelement_ww_current = fk_wastewater_networkelement_rw_current, fk_wastewater_networkelement_rw_current = DEFAULT, discharge_coefficient_ww_planned = discharge_coefficient_rw_planned, discharge_coefficient_rw_planned = DEFAULT WHERE old_art=2;



-- 4. update der oid spalten
UPDATE qgep.od_catchment_area SET old_obj_id=obj_id;

--- import spalten loeschen
ALTER TABLE qgep.od_catchment_area DROP COLUMN old_art;
ALTER TABLE qgep.od_catchment_area DROP COLUMN old_status;
 
