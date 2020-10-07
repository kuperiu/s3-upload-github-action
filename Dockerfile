FROM python:3.7-alpine

RUN pip install --quiet --no-cache-dir awscli
ENV GIT_SHA ${GITHUB_SHA}
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
