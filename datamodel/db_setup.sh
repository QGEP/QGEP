#!/bin/bash
psql "service=pg_qgep user=postgres" < 00_qgep_schema.sql
psql "service=pg_qgep user=postgres" < 01_audit.sql
psql "service=pg_qgep user=postgres" < 02_qgep_meta_dss.sql
psql "service=pg_qgep user=postgres" < 03_oid_generation.sql
psql "service=pg_qgep user=postgres" < 04_qgep_db_dss.sql
psql "service=pg_qgep user=postgres" < 05_vsa_kek_extension.sql
psql "service=pg_qgep user=postgres" < 06_data_model_extensions.sql
psql "service=pg_qgep user=postgres" < 07_symbology_functions.sql
psql "service=pg_qgep user=postgres" < 08_views_for_network_tracking.sql
psql "service=pg_qgep user=postgres" < 09_qgep_functions.sql
psql "service=pg_qgep user=postgres" < view/vw_access_aid.sql
psql "service=pg_qgep user=postgres" < view/vw_benching.sql
psql "service=pg_qgep user=postgres" < view/vw_channel.sql
psql "service=pg_qgep user=postgres" < view/vw_cover.sql
psql "service=pg_qgep user=postgres" < view/vw_discharge_point.sql
psql "service=pg_qgep user=postgres" < view/vw_dryweather_downspout.sql
psql "service=pg_qgep user=postgres" < view/vw_dryweather_flume.sql
psql "service=pg_qgep user=postgres" < view/vw_manhole.sql
psql "service=pg_qgep user=postgres" < view/vw_reach.sql
psql "service=pg_qgep user=postgres" < view/vw_special_structure.sql
psql "service=pg_qgep user=postgres" < view/vw_wastewater_node.sql
psql "service=pg_qgep user=postgres" < view/vw_wizard_cover_manhole.sql
psql "service=pg_qgep user=postgres" < view/vw_wizard_cover_special_structure.sql
psql "service=pg_qgep user=postgres" < view/vw_wizard_reach_channel.sql

