#!/bin/bash

set -e

zip qgep.zip project/*_??.qgs

python3 plugin_ci/release/create_release.py -f qgep.zip
