# Base image
FROM 		sinenomine/java-s390x:latest

# The author
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="6.10.2.0"

ENV 		JAVA_HOME=/opt/ibm/java PATH=$PATH:$JAVA_HOME/bin:/opt/ibm/nodejs/bin \
		NODEBIN=ibm-6.10.2.0-node-v6.10.2-linux-s390x.bin

COPY 		$NODEBIN nodejs.rsp /

RUN 		yum install -y tar zip && \
		mkdir -p /opt/ibm && \
		echo "Installing nodejs" && \
		/$NODEBIN -f /nodejs.rsp -i silent && \
		rm -rf $NODEBIN /nodejs.rsp /opt/ibm/_IBM* /opt/ibm/_uninstall && \
		yum erase -y tar zip && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

ENV 		PATH=$PATH:/opt/ibm/nodejs/bin

WORKDIR 	/data
