#!/bin/bash
# psql "service=pg_qgep user=postgres" < ../migration/00_1_copy_data
# psql "service=pg_qgep user=postgres" < ../migration/00_2_fix_geometries.sql
psql "service=pg_qgep user=postgres" < ../migration/01_od_organisation.sql
echo "*** ws ***"
psql "service=pg_qgep user=postgres" < ../migration/02_od_wastewater_structure.sql
echo "*** ch ***"
psql "service=pg_qgep user=postgres" < ../migration/03_od_channel.sql
echo "*** mh ***"
psql "service=pg_qgep user=postgres" < ../migration/04_od_manhole.sql
echo "*** dp ***"
psql "service=pg_qgep user=postgres" < ../migration/05_od_discharge_point.sql
echo "*** ss ***"
psql "service=pg_qgep user=postgres" < ../migration/06_od_special_structure.sql
echo "*** pp ***"
psql "service=pg_qgep user=postgres" < ../migration/08_od_pipe_profile.sql
echo "*** ne ***"
psql "service=pg_qgep user=postgres" < ../migration/09_od_wastewater_networkelement.sql
echo "*** rp ***"
psql "service=pg_qgep user=postgres" < ../migration/10_od_reach_point.sql
echo "*** wn ***"
psql "service=pg_qgep user=postgres" < ../migration/11_od_wastewater_node.sql
echo "*** re ***"
psql "service=pg_qgep user=postgres" < ../migration/12_od_reach.sql
echo "*** sp ***"
psql "service=pg_qgep user=postgres" < ../migration/13_od_structure_part.sql
echo "*** aa ***"
psql "service=pg_qgep user=postgres" < ../migration/14_od_access_aid.sql
echo "*** co ***"
psql "service=pg_qgep user=postgres" < ../migration/17_od_cover.sql
echo "*** ca ***"
psql "service=pg_qgep user=postgres" < ../migration/27_od_catchment_area.sql
echo "*** sym ***"
psql "service=pg_qgep user=postgres" < ../migration/50_update_symbology_attribs.sql
echo "*** fk ***"
psql "service=pg_qgep user=postgres" < ../migration/99_foreign_keys.sql
