# Run SAM Local in a container
#
# docker run --rm \
#   -e SAM_DOCKER_VOLUME_BASEDIR=${PWD}/path/to/module/root
#   -v .:/var/lib/sam-local \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   --name sam-local \
#   akirakoyasu/aws-sam-local \
#     sam --version
#

FROM node:8.9
LABEL maintainer="Akira Koyasu <mail@akirakoyasu.net>"

RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin
RUN mkdir -p /var/lib/sam-local \
  && chown node:node /var/lib/sam-local

USER node
WORKDIR /var/lib/sam-local

RUN npm install -g aws-sam-local

USER root
