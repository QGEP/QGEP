#!/bin/bash

if [ ! -d i18n ]
then
  echo "Could not find directory i18n, please run from qgepplugin directory";
  exit -1
fi
tx push -s -r QGEP.qgep-project
tx pull -r QGEP.qgep-project

python ./scripts/sync_translations.py

tx push -t -r QGEP.qgep-project

