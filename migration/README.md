These scripts convert DABASE (Modul SIA405Abwasser, German) to QGEP (English)

Preqrequisites
===========

These scripts assume that you already have the `postgis` and `hstore` extension installed.

On your PostgreSQL server execute the following SQL statement:

    CREATE EXTENSION postgis;
    CREATE EXTENSION hstore;

These scripts assume that you have two schemas in a common database.

 * abwasser
 * qgep

abwasser
-------

This schema contains tables imported from dabase. To import from an ili-file,
you can use the following command. The `ogr2ogr` command is required which is
part of the gdal or gdal-bin package. On Windows you can use
[OSGeo4W](http://trac.osgeo.org/osgeo4w/) to install it on windows.

You will also need
[ili2c](http://www.interlis.ch/interlis2/docs23/ili2c-4.5.3.zip). Extract the
file ili2c.jar into the current directory and execute the following command
(linux).

    PATH=$PATH:. ogr2ogr -skipfailure -a_srs "EPSG:21781" -gt 20000 -lco DIM=2 -lco schema=abwasser -lco GEOMETRY_NAME=the_geom -f "PostgreSQL" PG:"dbname='database' host='localhost' port='5432' user='user' password='password'" i1.itf,VSA_DSS_2008_1_d.ili

qgep
-------

This is the schema, where the data will be imported to. This schema is created
with the .sql-scripts from ../datamodel.

Migration process
===========
[001_1_copy_data] (https://github.com/qgep/QGEP/blob/master/migration/00_1_copy_data): Copy of data
[00_2_fix_geometries] (https://github.com/qgep/QGEP/blob/master/migration/00_2_fix_geometries.sql) Fix od_reach_point.fk_wastewater_networkelement
[*_od] Copy data from import database to qgep schema
Currently the following classes are supported (SIA405 Abwasser 2008, attributes of version 2012 are commented out -> think about additional scripts for each new version? Change of attribute names between version 2008 and 2012 are (should be) included here, also change of table names):

od_organisation
od_waste_water_structure
od_channel
od_manhole
od_discharge_point
od_special_structure
od_pipe_profile
od_wasterwater_networkelement
od_reach_point
od_waste_water_node
od_reach
od_structure_part
od_access_aid
od_cover

and od_catchment_area (as addtional VSA-DSS class)
Further classes would need an additional script per class

[50_foreign_keys] (https://github.com/qgep/QGEP/blob/master/migration/50_foreign_keys.sql): Updating foreign keys abwassernetzelement on haltung

TO DO Changing of values from model 2008 to 2012
Source "VSA-DSS Korrekturen und Neuerungen 2014 on VSA-DSS CD (2014)"

· Abwasserbauwerk.Status: Neu hierarchische Modellierung der Werte basierend auf
sia405_base.ili (Erweiterung dazu): Angepasste Werte: in_Betrieb.in_Betrieb statt in_Betrieb,
tot.aufgehoben_nicht_verfuellt, tot.aufgehoben_unbekannt, tot.verfuellt sowie
weitere.Berechnungsvariante, weitere.geplant und weitere.Projekt (jeweils Hierarchiewert
vorangestellt mit Punkt). (Neuerung SIA405 2012 / Korrektur 2014).

UPDATE qgep.od_wastewater_structure SET status =
  CASE 
    CASE WHEN 
        status = 0 THEN 3633 --- inoperative
        WHEN status = 1 THEN 6528 --- operational.operational
        WHEN status = 2 THEN 6530 --- operational.tentative
        WHEN status = 3 THEN 6533 --- operational.will_be_suspended
        WHEN status = 4 THEN 6523 --- abanndoned.suspended_not_filled
        WHEN status = 5 THEN 6524 --- abanndoned.suspended_unknown
        WHEN status = 6 THEN 6532 --- abanndoned.filled
        WHEN status = 7 THEN 3027 --- unknown
        WHEN status = 8 THEN 6526 --- other.calculation_alternative
        WHEN status = 9 THEN 6527 --- other.planned
        WHEN status = 10 THEN 6529 --- other.project
    ELSE function
  END

Maybe already set in [02_od_wastewater_structure] (https://github.com/qgep/QGEP/blob/master/migration/02_od_wastewater_structure.sql)
Keep and maintain for further release changes.

· Kanal.FunktionHierarchisch: Zuordnung aller Werte zu Primären (PAA) oder sekundären
Abwasseranlagen (SAA). (Wegleitung GEP-Daten 2013)

UPDATE qgep.od_channel SET function_hierarchic =
  CASE 
    WHEN funktionhierarchisch = 0 THEN 5066 --- pwwf.other
    WHEN funktionhierarchisch = 1 THEN 5068 --- pwwf.water_bodies
    WHEN funktionhierarchisch = 2 THEN 5069 --- pwwf.main_drain
    WHEN funktionhierarchisch = 3 THEN 5070 --- pwwf.main_drain_regional
    WHEN funktionhierarchisch = 4 THEN 5064 --- pwwf.residential_drainage
    WHEN funktionhierarchisch = 5 THEN 5071 --- pwwf.collector_sewer
    WHEN funktionhierarchisch = 6 THEN 5062 --- pwwf.renovation_conduction
    WHEN funktionhierarchisch = 7 THEN 5072 --- pwwf.road_drainage
    WHEN funktionhierarchisch = 8 THEN 5074 --- pwwf.unknown
    WHEN funktionhierarchisch = 9 THEN 5067 --- swwf.other
    WHEN funktionhierarchisch = 10 THEN 5065 --- swwf.residential_drainage
    WHEN funktionhierarchisch = 11 THEN 5063 --- swwf.renovation_conduction
    WHEN funktionhierarchisch = 12 THEN 5073 --- swwf.road_drainage
    WHEN funktionhierarchisch = 13 THEN 5075 --- swwf.unknown
    ELSE function
  END

· Messgeraet.Art: Neu Wertebereich statt Text: [andere, Drucksonde, Lufteinperlung,
MID_teilgefuellt, MID_vollgefuellt, Radar, Schwimmer, Ultraschall, unbekannt] (Wegleitung
GEP-Daten Stammkarten 2014)

· Messresultat.Messart: Neu Wertebereich statt Text: [andere, Durchfluss, Niveau, unbekannt]
· Normschacht.Funktion: Neue Werte [Regenueberlauf], ersetzt Hochwasserentlastung,
(Wegleitung GEP-Daten).

UPDATE qgep.od_manhole SET function =
  CASE 
    WHEN funktion = 10 THEN 5346 --- stormwater_overflow, may be only change in German
    ELSE function
  END

· Normschacht.Funktion: Klaergrube aufgehoben, nur noch in Spezialbauwerk.Funktion

WHEN funktion = 11 THEN 2742 --- slurry_collector
Move object from qgep.od_manhole to qgep.od_special_structure
Or delete in od_manhole and create new in od_special_structure? 

· Spezialbauwerk.Funktion: Neue Werte [Duekeroberhaupt, Regenbecken_Fangkanal,
Regenbecken_Regenrueckhaltekanal, Regenbecken_Stauraumkanal, Regenueberlauf].
Regenueberlauf ersetzt Hochwasserentlastung.
Guellegrube ersetzt Jauchegrube (Wegleitung GEP-Daten und Abwasserentsorgung im
ländlichen Raum (ALR)).
Neue Werte abflussloseGrube, Abwasserfaulraum, Faulgrube (Abwasserentsorgung im
ländlichen Raum (ALR) 2014)

UPDATE qgep.od_special_structre SET function =
  CASE 
    CASE WHEN funktion = 0 THEN 6397 --- pit_without_drain
        WHEN funktion = 1 THEN 245 --- drop_structure
        WHEN funktion = 2 THEN 6398 --- hydrolizing_tank
        WHEN funktion = 3 THEN 5371 --- other
        WHEN funktion = 4 THEN 386 --- venting
        WHEN funktion = 5 THEN 3234 --- inverse_syphon_chamber
        WHEN funktion = 6 THEN 5091 --- syphon_head
        WHEN funktion = 7 THEN 6399 --- septic_tank_two_chambers
        WHEN funktion = 8 THEN 3348 --- terrain_depression
        WHEN funktion = 9 THEN 336 --- bolders_bedload_catchement_dam
        WHEN funktion = 10 THEN 5494 --- cesspit / Guellegrube ersetzt Jauchegrube
        WHEN funktion = 11 THEN 6478 --- septic_tank
        WHEN funktion = 12 THEN 2998 --- manhole
        WHEN funktion = 13 THEN 2768 --- oil_separator
        WHEN funktion = 14 THEN 246 --- pump_station
        WHEN funktion = 15 THEN 3673 --- stormwater_tank_with_overflow
        WHEN funktion = 16 THEN 3674 --- stormwater_tank_retaining_first_flush
        WHEN funktion = 17 THEN 5574 --- stormwater_retaining_channel
        WHEN funktion = 18 THEN 3675 --- stormwater_sedimentation_tank
        WHEN funktion = 19 THEN 3676 --- stormwater_retention_tank
        WHEN funktion = 20 THEN 5575 --- stormwater_retention_channel
        WHEN funktion = 21 THEN 5576 --- stormwater_storage_channel
        WHEN funktion = 22 THEN 3677 --- stormwater_composite_tank
        WHEN funktion = 23 THEN 5372 --- stormwater_overflow
        WHEN funktion = 24 THEN 5373 --- floating_material_separator
        WHEN funktion = 25 THEN 383 --- side_access
        WHEN funktion = 26 THEN 227 --- jetting_manhole
        WHEN funktion = 27 THEN 4799 --- separating_structure
        WHEN funktion = 28 THEN 3008 --- unknown
        WHEN funktion = 29 THEN 2745 --- vortex_manhole
    ELSE function
  END

Changes of datatypes - multiply value with factor 1000:
· Ueberlauf.Qan_Ist: Neu l/s statt m3/s (Wegleitung GEP-Daten Stammkarten 2014)
· Ueberlauf.Qan_dim: Neu l/s statt m3/s (Wegleitung GEP-Daten Stammkarten 2014)
· Versickerungsanlage.Schluckvermoegen: Neu l/s statt m3/s (Wegleitung GEP-Daten
Stammkarten 2014)

Korrektur Datentyp in INTERLIS: Neuer Datentyp Position = 1 .. 999 statt Number = -
99999999.9999 .. 99999999.9999. Integer statt Real für Klasse
Rohrprofil_Geometrie.Position (SIA405 2012)

Change Real values to Integer values

· Korrektur Datentyp in INTERLIS: Neuer Datentyp Aggregatezahl = 1 .. 9 statt Number = -
99999999.9999 .. 99999999.9999. Integer statt Real für Klasse Foerderaggregat, Attribut
Aggregatezahl bzw. neu Hydr_Kennwerte.Aggregatezahl. (Korrektur 2014)

Change Real values to Integer values

· Korrektur Datentyp in INTERLIS: Neuer Datentyp Ueberlaufhaeufigkeit = 0.0 .. 999.9 statt
Number = -99999999.9999 .. 99999999.9999. Ueberlauf.Ueberlaufhaeufigkeit. Bisher
Fehler beim Datentyp. Ueberlaufhaeufigkeit kann keine negative Realzahl sein.

Change values to dataype (round if needed)

· Neuer Datentyp Gefaelle_Promill [-10‘000 .. 10‘000] für Haltung.Plangefaelle (Werte > 1000
‰. nur bei Steilleitungen),
· Neuer Datentyp Neigung_Promill: EZG_Parameter_ALLG.Fliessweggefaelle,
EZG_PARAMETER_MOUSE1.Fliessweggefaelle und Einzelflaeche.Neigung: Neigung_Promill
[0..10‘000] anstatt statistisches Promilll [Units.Promill].
· Neuer Datentyp Neigung_Prozent [0..1000] für Einleitstelle.relevantes_Gefaelle

Multiply values with factor 10 to change from range [0..100] Prozent to Promill

Moving objects with certain criteria into another class:

· ElektromechanischeAusruestung.Art: Wert Injektorpumpe (neu als Air_Jet) aufgehoben, neu
Beckenreinigung.Art [Air_Jet], (Wegleitung GEP-Daten Stammkarten 2014)

· ElektromechanischeAusruestung.Art: Werte Feinrechen, Grobrechen, Sieb, Tauchwand – neu
in Feststoffrueckhalt.Art, (Wegleitung GEP-Daten Stammkarten 2014)

· ElektromechanischeAusruestung.Art: Werte Spuelkippe – neu in Beckenreinigung.Art,
(Wegleitung GEP-Daten Stammkarten 2014)

Check AREA:
· See.Perimeter – neu wieder als SURFACE anstatt als AREA definiert (Korrektur 2014).
Seeflächen dürfen sich zwar nicht überlappen, die Seen sind aber auch keine lückenlose
Fläche.

Rebuilding of catchement areas from version 2008 to 2012



Individual remappings from project Arbon
[function_remap] (https://github.com/qgep/QGEP/blob/master/migration/fixup/function_remap.sql): 
UPDATE qgep.od_manhole SET function =
  CASE 
    WHEN function = 4536 THEN 204 --
    WHEN function = 5346 THEN 1008
    WHEN function = 204 THEN 5344
    WHEN function = 5347 THEN 2742 
    ELSE function
  END
  
[70_refresh_materialized_views] (https://github.com/qgep/QGEP/blob/master/migration/70_refresh_materialized_views.sql)
[90_update_symbology_attribs] (https://github.com/qgep/QGEP/blob/master/migration/90_update_symbology_attribs.sql)


