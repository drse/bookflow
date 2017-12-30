FROM node:7-slim

ADD provision.sh /tmp/
RUN cd /tmp/ && sh provision.sh

WORKDIR /docs

# run GitBook when the container starts
ENTRYPOINT ["gitbook"]