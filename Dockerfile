FROM google/cloud-sdk:263.0.0-alpine
ENV TERRAFORM_VERSION=0.12.9
WORKDIR /tmp
RUN apk update && \
    apk add --no-cache bash ca-certificates git openssl unzip wget \
    openssh docker
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
WORKDIR /work
CMD ["bash"]