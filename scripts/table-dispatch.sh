#!/usr/bin/env bash


set -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# GNU prefix command for mac os support (gsed, gsplit)
GP=
if [[ "$OSTYPE" =~ darwin* ]]; then
  GP=g
fi

find ${DIR}/../project -type f -iname "*.qgs" -exec ${GP}sed -i.bak -r 's/(")?qgep(")?\.(")?(re|txt)_/\1qgep_od\2.\3\4_/g' {} \; # txt* and re_maintenance_event_... are ind od schema
find ${DIR}/../project -type f -iname "*.qgs" -exec ${GP}sed -i     -r 's/(")?qgep(")?\.(")?vw_/\1qgep_od\2.\3vw_/g' {} \;
find ${DIR}/../project -type f -iname "*.qgs" -exec ${GP}sed -i     -r 's/(")?qgep(")?\.(")?od_/\1qgep_od\2.\3/g' {} \;
find ${DIR}/../project -type f -iname "*.qgs" -exec ${GP}sed -i     -r 's/(")?qgep(")?\.(")?vl_/\1qgep_vl\2.\3/g' {} \;
find ${DIR}/../project -type f -iname "*.qgs" -exec ${GP}sed -i     -r 's/(")?qgep(")?\.(")?is_/\1qgep_sys\2.\3/g' {} \;
