#!/bin/bash
OIDPREFIX="ch13p7mz"

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..

psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "UPDATE qgep.is_oid_prefixes SET active=TRUE WHERE prefix='${OIDPREFIX}'"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "UPDATE qgep.is_oid_prefixes SET active=FALSE WHERE prefix<>'${OIDPREFIX}'"

# psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/00_1_copy_data
# psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/00_2_fix_geometries.sql
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "SELECT qgep.drop_symbology_triggers();"
echo "*** Migrate 01_od_organisation ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/01_od_organisation.sql
echo "*** Migrate 02_od_wastewater_structure ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/02_od_wastewater_structure.sql
echo "*** Migrate 03_od_channel ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/03_od_channel.sql
echo "*** Migrate 04_od_manhole ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/04_od_manhole.sql
echo "*** Migrate 05_od_discharge_point ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/05_od_discharge_point.sql
echo "*** Migrate ss 06_od_special_structure ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/06_od_special_structure.sql
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
echo "*** Create main covers ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/22_main_cover.sql
echo "*** Migrate 27_od_catchment_area ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/27_od_catchment_area.sql
echo "*** Migrate 50_foreign_keys ***"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -f ${DIR}/migration/50_foreign_keys.sql

psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "VACUUM ANALYZE;"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "SELECT qgep.update_wastewater_structure_label(NULL, true);"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "SELECT qgep.update_wastewater_structure_symbology(NULL, true);"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "SELECT qgep.update_depth(NULL, true);"
psql "service=pg_qgep user=postgres" -v ON_ERROR_STOP=1 -c "SELECT qgep.create_symbology_triggers();"
