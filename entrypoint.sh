#!/bin/bash 
GITHUB_REPOSITORY=$(basename $GITHUB_REPOSITORY)
aws sts get-caller-identity > /tmp/test

env

cat /var/run/secrets/eks.amazonaws.com/serviceaccount
aws s3 cp ${FILE} s3://${S3_BUCKET}/${GITHUB_REPOSITORY}/${GITHUB_SHA:0:10}.zip --region ${AWS_REGION} $*
exit $?

# while true; do
#  echo ""
# done