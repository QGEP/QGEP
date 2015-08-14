#!/bin/bash
set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..

# psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/00_1_copy_data
# psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/00_2_fix_geometries.sql
echo "*** Migrate 01_od_organisation ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/01_od_organisation.sql
echo "*** Migrate 02_od_wastewater_structure (08) ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration08/02_od_wastewater_structure.sql
echo "*** Migrate 03_od_channel (08) ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration08/03_od_channel.sql
echo "*** Migrate 04_od_manhole (08) ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration08/04_od_manhole.sql
echo "*** Migrate 05_od_discharge_point (08) ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration08/05_od_discharge_point.sql
echo "*** Migrate ss 06_od_special_structure (08) ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration08/06_od_special_structure.sql
echo "*** Migrate 08_od_pipe_profile ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/08_od_pipe_profile.sql
echo "*** Migrate 09_od_wastewater_networkelement ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/09_od_wastewater_networkelement.sql
echo "*** Migrate 10_od_reach_point ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/10_od_reach_point.sql
echo "*** Migrate 11_od_wastewater_node ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/11_od_wastewater_node.sql
echo "*** Migrate 12_od_reach ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/12_od_reach.sql
echo "*** Migrate 13_od_structure_part ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/13_od_structure_part.sql
echo "*** Migrate 14_od_access_aid ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/14_od_access_aid.sql
echo "*** Migrate 17_od_cover ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/17_od_cover.sql
echo "*** Migrate 27_od_catchment_area (08) ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration08/27_od_catchment_area.sql
echo "*** Migrate 50_foreign_keys ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/50_foreign_keys.sql
echo "*** Migrate 90_update_symbology_attribs ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/90_update_symbology_attribs.sql

