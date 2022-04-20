FROM jenkins/inbound-agent:4.13-1
LABEL maintainer tanmay.x.saha@gmail.com

USER root

# Install Build dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends jq unzip curl hub sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN usermod -aG sudo jenkins
RUN echo 'jenkins ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

USER jenkins
