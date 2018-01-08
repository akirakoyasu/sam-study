#!/bin/bash
set -exu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

exec docker-compose \
  --file docker-compose.spec.yml \
  run \
  --rm \
  lambda-python -m unittest discover

cd -
