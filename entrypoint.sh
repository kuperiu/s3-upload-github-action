#!/bin/sh 

set -e

# if [ -z "$S3_BUCKET" ]; then
#   echo "S3_BUCKET is not set. Quitting."
#   exit 1
# fi
# if [ -z "$AWS_ACCESS_KEY_ID" ]; then
#   echo "AWS_ACCESS_KEY_ID is not set. Quitting."
#   exit 1
# fi
# if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
#   echo "AWS_SECRET_ACCESS_KEY is not set. Quitting."
#   exit 1
# fi

# if [-z "$FILE"]; then
#   echo "FILE is not set. Quitting"
#   exit 1
# fi

# if [ -z "$AWS_REGION"]; then
#   AWS_REGION="us-east-1"
# fi

GITHUB_REPOSITORY=$(basename $GITHUB_REPOSITORY)
CREDENTIALS=`aws sts assume-role --role-arn ${ROLE_ARN} --role-session-name RoleSession --duration-seconds 900 --output=json`
AWS_ACCESS_KEY_ID=`echo ${CREDENTIALS} | jq -r '.Credentials.AccessKeyId'`
AWS_SECRET_ACCESS_KEY=`echo ${CREDENTIALS} | jq -r '.Credentials.SecretAccessKey'`
AWS_SESSION_TOKEN=`echo ${CREDENTIALS} | jq -r '.Credentials.SessionToken'`
aws s3 cp ${FILE} s3://${S3_BUCKET}/${GITHUB_REPOSITORY}/${GITHUB_SHA:0:10}.zip --region ${AWS_REGION} $*



