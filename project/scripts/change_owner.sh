#!/bin/bash
owner=qgep
schema=qgep
database=qgep
uri="service=pg_qgep user=postgres"
psql "$uri" -c "alter schema $schema owner to $owner" ;
for tbl in `psql "$uri" -qAt -c "select tablename from pg_tables where schemaname = '$schema';" $database` ; do  psql "$uri" -c "alter table $schema.$tbl owner to $owner" $database ; done
for tbl in `psql "$uri" -qAt -c "select table_name from information_schema.views where table_schema = '$schema';" $database` ; do  psql "$uri" -c "alter table $schema.$tbl owner to $owner" $database ; done
for tbl in `psql "$uri" -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = '$schema';" $database` ; do  psql "$uri" -c "alter table $schema.$tbl owner to $owner" $database ; done
# Materialized views are not reported by information_schema
psql "$uri" -c "alter table $schema.vw_network_node owner to $owner" $database
psql "$uri" -c "alter table $schema.vw_network_segment owner to $owner" $database
