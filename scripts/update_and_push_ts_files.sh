#!/bin/bash

docker-compose -f .docker/docker-compose.travis.yml run qgis /usr/src/scripts/docker/create_translations.sh
docker-compose -f .docker/docker-compose.travis.yml rm -s -f

tx push -s
