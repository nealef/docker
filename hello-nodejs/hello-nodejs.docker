# Base image
FROM clefos71-nodejs-s390x:latest

# The author
MAINTAINER The ClefOS Project <neale@sinenomine.net>
LABEL Vendor="ClefOS" License="GPLv2" Version="1.0-0.1"

RUN mkdir -p /src && \
	cd /src && \
	npm install express --save 

COPY package.json index.js /src/

ENV JAVA_HOME=/opt/ibm/java PATH=$PATH:$JAVA_HOME/bin:/opt/ibm/nodejs/bin NODE_PATH=/src/node_modules

CMD node /src/index.js
