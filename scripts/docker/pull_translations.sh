#!/bin/bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

${DIR}/initialize_db.sh

for f in /usr/src/project/*\_*.ts
do
	lrelease $f ${f%.ts}.qm
done
