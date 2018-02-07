#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
./scripts/lambda-python -m unittest discover
