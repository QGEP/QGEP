#!/bin/bash
if [ "0$PGSERVICE" = "0" ]
then
  PGSERVICE=pg_qgep
fi

rm .~qgep_import.sql

touch .~qgep_import.sql


cat ../datamodel/00_qgep_schema.sql                         >> .~qgep_import.sql
cat ../datamodel/01_audit.sql                               >> .~qgep_import.sql
cat ../datamodel/02_oid_generation.sql                      >> .~qgep_import.sql
cat ../datamodel/03_qgep_db_dss.sql                         >> .~qgep_import.sql
cat ../datamodel/04_vsa_kek_extension.sql                   >> .~qgep_import.sql
cat ../datamodel/05_data_model_extensions.sql               >> .~qgep_import.sql
cat ../datamodel/06_symbology_functions.sql                 >> .~qgep_import.sql
cat ../datamodel/07_views_for_network_tracking.sql          >> .~qgep_import.sql
cat ../datamodel/08_qgep_functions.sql                      >> .~qgep_import.sql
cat ../datamodel/09_qgep_dictionaries.sql                   >> .~qgep_import.sql
cat ../datamodel/view/vw_access_aid.sql                     >> .~qgep_import.sql
cat ../datamodel/view/vw_benching.sql                       >> .~qgep_import.sql
cat ../datamodel/view/vw_channel.sql                        >> .~qgep_import.sql
cat ../datamodel/view/vw_cover.sql                          >> .~qgep_import.sql
cat ../datamodel/view/vw_discharge_point.sql                >> .~qgep_import.sql
cat ../datamodel/view/vw_dryweather_downspout.sql           >> .~qgep_import.sql
cat ../datamodel/view/vw_dryweather_flume.sql               >> .~qgep_import.sql
cat ../datamodel/view/vw_manhole.sql                        >> .~qgep_import.sql
cat ../datamodel/view/vw_reach.sql                          >> .~qgep_import.sql
cat ../datamodel/view/vw_special_structure.sql              >> .~qgep_import.sql
cat ../datamodel/view/vw_wastewater_node.sql                >> .~qgep_import.sql
cat ../datamodel/view/vw_wizard_cover_manhole.sql           >> .~qgep_import.sql
cat ../datamodel/view/vw_wizard_cover_special_structure.sql >> .~qgep_import.sql
cat ../datamodel/view/vw_wizard_reach_channel.sql           >> .~qgep_import.sql

sed -i 's/\xEF\xBB\xBF//' .~qgep_import.sql

psql "service=$PGSERVICE" -v ON_ERROR_STOP=1 -f .~qgep_import.sql

#rm .~qgep_import.sql
