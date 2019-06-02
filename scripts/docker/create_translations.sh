#!/bin/bash

printf "[pg_qgep]\nhost=postgres\nport=5432\ndbname=gis\nuser=docker\npassword=docker" > ~/.pg_service.conf

wget https://github.com/QGEP/datamodel/releases/download/1.2.0/qgep_v1.2.0_structure_with_value_lists.sql

set -e
echo "Wait a moment while the database is being loaded"
while ! psql "service=pg_qgep" -l &> /dev/null
do
  printf "."
  sleep 1
done
echo ""
psql "service=pg_qgep" -f qgep_v1.2.0_structure_with_value_lists.sql
psql "service=pg_qgep" -c "REFRESH MATERIALIZED VIEW qgep_od.vw_network_node;"
psql "service=pg_qgep" -c "REFRESH MATERIALIZED VIEW qgep_od.vw_network_segment;"

xvfb-run python3 /usr/src/scripts/create_ts_files.py
