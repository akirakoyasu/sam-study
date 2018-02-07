#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
pip3 freeze -r requirements-default.txt \
 | sed -ne '/^## The following requirements were added by pip freeze/,$p' \
 >requirements.txt

cat requirements.txt
