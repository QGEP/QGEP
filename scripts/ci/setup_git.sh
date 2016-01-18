#!/bin/bash

if test "$TRAVIS_SECURE_ENV_VARS" = "true" -a "$TRAVIS_BRANCH" = "master";
then
  openssl aes-256-cbc -K $encrypted_a8407ccc2176_key -iv $encrypted_a8407ccc2176_iv -in qgep_rsa.enc -out ~/.ssh/id_rsa -d
  chmod 600 ~/.ssh/id_rsa;
  git config --global user.email "qgep@opengis.ch";
  git config --global user.name "QGEP";
  git config --global push.default simple;
else
  sed -i 's|git@github.com:|https://github.com/|' .gitmodules
fi

git submodule update --init

sed -i 's|git@github.com:|https://github.com/|' datamodel/.gitmodules

git submodule update --init --recursive
