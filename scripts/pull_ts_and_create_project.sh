#!/bin/bash

tx pull -a

docker-compose -f .docker/docker-compose.travis.yml run qgis /usr/src/scripts/docker/pull_translations.sh
docker-compose -f .docker/docker-compose.travis.yml rm -s -f
