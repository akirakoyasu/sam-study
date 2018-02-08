#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
rm -rf ./src/app/site-packages/*

./scripts/lambda-python -- pip3 install \
  --requirement /var/task/requirements.txt \
  --no-deps \
  --upgrade \
  --target /var/task/src/app/site-packages
