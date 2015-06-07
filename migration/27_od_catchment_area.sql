------ 26.0814: for development only, uses table ezg in schema public
------ This file is sql code to import DABASE (Modul SIA405Abwasser) in German to QGEP in Englisch on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 07.06.2014 22:00:52

-- 1. ergaenzen tabelle mit oid spalte
ALTER TABLE qgep.od_catchment_area DROP COLUMN IF EXISTS old_obj_id;
ALTER TABLE qgep.od_catchment_area ADD COLUMN old_obj_id text;

-------
-- 2. loeschen vorhandener daten
DELETE FROM qgep.od_catchment_area;

-- 3. einsetzen der daten von siedlungsentwaesserung in qgep.
INSERT INTO qgep.od_catchment_area
(
-- direct_discharge_current,
-- direct_discharge_planned,
discharge_coefficient_rw_current,
-- discharge_coefficient_rw_planned,
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
old_obj_id
)
SELECT
abflussbeiwert,
--- art,
bezeichnung,
ST_MakePolygon( ST_GeometryN( the_geom, 1 ) ),
bemerkung,
ST_Area(ST_GeometryN( the_geom, 1 ))/1000, -- m^2 zu ha
q_wastewater_networkelement.obj_id,
a_ezg.obj_id
FROM abwasser.siedlungsentwaesserung__einzugsgebiet a_ezg
LEFT JOIN qgep.od_wastewater_networkelement q_wastewater_networkelement
on a_ezg.abwassernetzelement = q_wastewater_networkelement.old_obj_id;

