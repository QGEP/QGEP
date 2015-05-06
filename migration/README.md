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
For details see VSA-DSS Korrekturen und Neuerungen 2014 on VSA-DSS CD (2014)

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


