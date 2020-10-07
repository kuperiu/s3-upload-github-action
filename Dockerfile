FROM python:3.7-alpine

RUN pip install --quiet --no-cache-dir awscli
RUN apk update && apk add jq
ENV GITHUB_SHA ${GITHUB_SHA}
ENV GITHUB_REPOSITORY ${GITHUB_REPOSITORY}
ENV ROLE_ARN ${ROLE_ARN}
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
