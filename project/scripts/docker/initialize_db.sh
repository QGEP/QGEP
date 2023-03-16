#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo 'Restoring database' && echo -en 'travis_fold:start:restore-db\\r'

printf "[pg_qgep]\nhost=postgres\nport=5432\ndbname=gis\nuser=docker\npassword=docker" > ~/.pg_service.conf

DATAMODEL_VERSION=$(cat ${DIR}/../../datamodel_version.txt)

wget https://github.com/QGEP/datamodel/releases/download/${DATAMODEL_VERSION}/qgep_${DATAMODEL_VERSION}_structure_with_value_lists.sql

set -e
echo "Wait a moment while the database is being loaded"
while ! psql "service=pg_qgep" -l &> /dev/null
do
  printf "."
  sleep 1
done
echo ""
psql "service=pg_qgep" -f qgep_${DATAMODEL_VERSION}_structure_with_value_lists.sql
psql "service=pg_qgep" -c "REFRESH MATERIALIZED VIEW qgep_od.vw_network_node;"
psql "service=pg_qgep" -c "REFRESH MATERIALIZED VIEW qgep_od.vw_network_segment;"

echo -en 'travis_fold:end:restore-db\\r'
