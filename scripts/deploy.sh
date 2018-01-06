#!/bin/bash
set -exu

aws cloudformation package \
    --template-file ./template.yml \
    --s3-bucket serverless.akirakoyasu \
    --s3-prefix sam-study \
    --output-template-file packaged-template.yml

aws cloudformation deploy \
    --template-file ./packaged-template.yml \
    --stack-name sam-study-stack \
    --capabilities CAPABILITY_IAM

aws s3 rm --recursive s3://serverless.akirakoyasu/sam-study
