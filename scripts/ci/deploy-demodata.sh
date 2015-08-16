#!/bin/bash

# Exit on error
set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../..

if test "$TRAVIS_SECURE_ENV_VARS" = "true" -a "$TRAVIS_BRANCH" = "master";
then
  echo "updating demodata";

  pushd ${DIR}
  cd data
  git checkout demodata
  pg_dump -n "qgep" -Fc qgep > qgep_demodata.backup

  mkdir -p project

  cp -r ${DIR}/project/fonts \
        ${DIR}/project/forms \
        ${DIR}/project/qgep_en.qgs \
        ${DIR}/project/reach.py \
        ${DIR}/project/svg \
        project

  git add -A
  git commit -m "Automatic update from https://github.com/qgep/QGEP/commit/${TRAVIS_COMMIT}"
  git push
  popd
fi
