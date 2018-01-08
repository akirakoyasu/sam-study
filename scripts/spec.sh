#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
exec docker-compose \
  --file docker-compose.spec.yml \
  run \
  --rm \
  lambda-python -m unittest discover
