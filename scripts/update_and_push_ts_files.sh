#!/bin/bash

echo 'Building docker container...' && echo -en 'travis_fold:start:docker-build\\r'
docker-compose -f .docker/docker-compose.travis.yml build qgis
echo -en 'travis_fold:end:docker-build\\r'
docker-compose -f .docker/docker-compose.travis.yml run qgis /usr/src/scripts/docker/create_translations.sh
docker-compose -f .docker/docker-compose.travis.yml rm -s -f

tx push -s
