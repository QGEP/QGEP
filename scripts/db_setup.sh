#!/bin/bash
psql "service=pg_qgep user=postgres" < ../datamodel/00_qgep_schema.sql
psql "service=pg_qgep user=postgres" < ../datamodel/01_audit.sql
psql "service=pg_qgep user=postgres" < ../datamodel/02_qgep_meta_dss.sql
psql "service=pg_qgep user=postgres" < ../datamodel/03_oid_generation.sql
psql "service=pg_qgep user=postgres" < ../datamodel/04_qgep_db_dss.sql
psql "service=pg_qgep user=postgres" < ../datamodel/05_vsa_kek_extension.sql
psql "service=pg_qgep user=postgres" < ../datamodel/06_data_model_extensions.sql
psql "service=pg_qgep user=postgres" < ../datamodel/07_symbology_functions.sql
psql "service=pg_qgep user=postgres" < ../datamodel/08_views_for_network_tracking.sql
psql "service=pg_qgep user=postgres" < ../datamodel/09_qgep_functions.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_access_aid.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_benching.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_channel.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_cover.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_discharge_point.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_dryweather_downspout.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_dryweather_flume.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_manhole.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_reach.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_special_structure.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_wastewater_node.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_wizard_cover_manhole.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_wizard_cover_special_structure.sql
psql "service=pg_qgep user=postgres" < ../datamodel/view/vw_wizard_reach_channel.sql

