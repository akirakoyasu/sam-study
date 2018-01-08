#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

set -x
mkdir -p ./build

aws cloudformation package \
    --template-file ./template.yml \
    --s3-bucket serverless.akirakoyasu \
    --s3-prefix sam-study \
    --output-template-file ./build/packaged-template.yml

aws cloudformation deploy \
    --template-file ./build/packaged-template.yml \
    --stack-name sam-study-stack \
    --capabilities CAPABILITY_IAM

aws s3 rm --recursive s3://serverless.akirakoyasu/sam-study
