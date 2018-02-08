#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
# this venv for dependency management only
./scripts/lambda-python -m venv --clear /var/venv
./scripts/lambda-python -- /var/venv/bin/pip3 install \
  --no-deps \
  --requirement /var/task/requirements.txt
./scripts/lambda-python -- /var/venv/bin/pip3 install "$@"
./scripts/lambda-python -- /var/venv/bin/pip3 freeze \
  --requirement /var/task/requirements-default.txt \
  | sed -ne '/^## The following requirements were added by pip freeze/,$p' \
  >requirements.txt
cat requirements.txt

./scripts/install.sh
