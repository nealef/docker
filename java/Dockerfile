# Base image
FROM		sinenomine/clefos-base-s390x:latest

# The author
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="8.0-3.22"

ENV		JAVABIN=ibm-java-s390x-sdk-8.0-3.22.bin

COPY 		dummy-java-1.8-0.el7.noarch.rpm $JAVABIN java.rsp /

RUN 		yum --setopt=tsflags=nodocs upgrade -y && \
		yum install -y tar zip && \
		mkdir -p /opt/ibm && \
		echo "Installing IBM JDK" && \
		/$JAVABIN -f /java.rsp -i silent && \
		yum install -y dummy-java-1.8-0.el7.noarch.rpm && \
		yum erase -y tar zip vim-minimal && \
		yum clean all && \
		rm -f /*.rpm /java.rsp /*.bin && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

ENV 		JAVA_HOME=/opt/ibm/java 

ENV 		PATH=$JAVA_HOME/bin:$PATH
