# Base image
FROM clefos71-java-s390x:latest

# The author
MAINTAINER The ClefOS Project <neale@sinenomine.net>
LABEL Vendor="ClefOS" License="GPLv2" Version="8.0-10.1"

COPY ibm-1.2.0.6-node-v0.12.7-linux-s390x.bin nodejs.rsp /

ENV JAVA_HOME=/opt/ibm/java PATH=$PATH:$JAVA_HOME/bin:/opt/ibm/nodejs/bin

RUN yum install -y tar zip && \
	mkdir -p /opt/ibm && \
	echo "Installing nodejs" && \
	/ibm-1.2.0.6-node-v0.12.7-linux-s390x.bin -f /nodejs.rsp -i silent && \
	rm -f /ibm-1.2.0.6-node-v0.12.7-linux-s390x.bin /nodejs.rsp && \
	yum erase -y tar zip && \
	yum clean all

ENV PATH=$PATH:/opt/ibm/nodejs/bin

WORKDIR /data
