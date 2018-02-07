#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
pip3 install \
  --requirement requirements.txt \
  --no-deps \
  --upgrade \
  --target src/app
