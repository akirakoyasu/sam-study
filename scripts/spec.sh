#!/bin/bash
set -exu

cwd=$(cd $(dirname "$0"); pwd)

echo "{}" \
| exec docker-compose run \
  --rm \
  -e SAM_DOCKER_VOLUME_BASEDIR="${cwd}/../src" \
  sam-local \
  sam local invoke "SpecBootstrap" --template=template-spec.yml
