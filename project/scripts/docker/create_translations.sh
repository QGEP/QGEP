#!/bin/bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

${DIR}/initialize_db.sh

xvfb-run python3 /usr/src/scripts/create_ts_files.py
