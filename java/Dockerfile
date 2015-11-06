# Base image
FROM	clefos71-base-s390x:latest

# The author
MAINTAINER The ClefOS Project <neale@sinenomine.net>
LABEL 	Vendor="ClefOS" License="GPLv2" Version="8.0-10.1"

COPY 	ibm-java-sdk-8.0-1.10-s390x-archive.bin java.rsp dummy-java-1.8-0.el7.noarch.rpm /

RUN 	yum install -y tar zip && \
	mkdir -p /opt/ibm && \
	echo "Installing IBM JDK" && \
	/ibm-java-sdk-8.0-1.10-s390x-archive.bin -f /java.rsp -i silent && \
	rm -f /ibm-java-sdk-8.0-1.10-s390x-archive.bin /java.rsp && \
	yum install -y dummy-java-1.8-0.el7.noarch.rpm && \
	yum erase -y tar zip vim-minimal && \
	yum clean all && \
	rm -f /*.rpm

ENV 	JAVA_HOME=/opt/ibm/java PATH=$JAVA_HOME/bin:$PATH
