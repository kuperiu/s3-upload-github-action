FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y jq curl zip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
RUN unzip /tmp/awscliv2.zip -d /tmp
RUN /tmp/aws/install
ENV GITHUB_SHA ${GITHUB_SHA}
ENV GITHUB_REPOSITORY ${GITHUB_REPOSITORY}
ENV ROLE_ARN ${ROLE_ARN}
ENV AWS_ROLE_ARN ${AWS_ROLE_ARN}
RUN echo ${AWS_IAM_TOKEN} > /var/run/secrets/eks.amazonaws.com/serviceaccount/token
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
