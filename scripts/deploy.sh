#!/bin/bash
set -eu

cwd=$(cd $(dirname "$0"); pwd)
cd "${cwd}/.."

delete_old_revisions_from_s3() {
  aws s3 ls s3://serverless.akirakoyasu/sam-study/ \
    | sort -nr \
    | tail -n +6 \
    | awk '{print $4}' \
    | xargs -I{} -t aws s3 rm s3://serverless.akirakoyasu/sam-study/{}
}

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

delete_old_revisions_from_s3
