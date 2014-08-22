These scripts convert DABASE (Modul SIA405Abwasser, German) to QGEP (English)

Preqrequisites
===========

These scripts assume that you already have the `postgis` extension installed.

On your PostgreSQL server execute the following SQL statement:

    CREATE EXTENSION postgis;

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
