#!/bin/bash

# This script will create a clean datastructure for the QGEP project based on
# the SIA 405 datamodel.
# It will create a new schema qgep in the postgres database.
#
# Environment variables:
#
#  * PGSERVICE
#      Specifies the postgres database to be used
#      Examples:
#        export PGSERVICE=pg_qgep
#        export PGSERVICE="pg_qgep user=postgres"

# Exit on error
set -e

if [ "0${PGSERVICE}" = "0" ]
then
  PGSERVICE=pg_qgep
fi

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/00_qgep_schema.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/01_audit.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/02_oid_generation.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/03_qgep_db_dss.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/04_vsa_kek_extension.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/05_data_model_extensions.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/06_symbology_functions.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/07_views_for_network_tracking.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/08_qgep_functions.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/09_qgep_dictionaries.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_access_aid.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_benching.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_channel.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_cover.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_discharge_point.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_dryweather_downspout.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_dryweather_flume.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_manhole.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_reach.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_special_structure.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_wastewater_node.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_wizard_cover_manhole.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_wizard_cover_special_structure.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ../datamodel/view/vw_wizard_reach_channel.sql
