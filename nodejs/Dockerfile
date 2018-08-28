FROM 		clefos/ibmjava:8

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

ENV 		JAVA_HOME=/opt/ibm/java PATH=$PATH:$JAVA_HOME/bin:/opt/ibm/nodejs/bin \
		NODEBIN=ibm-8.9.4.0-node-v8.9.4-linux-s390x.bin

RUN 		yum update -y && \
    		yum install -y wget tar zip && \
		mkdir -p /opt/ibm

RUN 		ESUM="a9a6df71b7af87ece5e6c9afbd9009aca194c9fac67910baa812b7fa2d893e02" && \
    		wget https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/nodejs/8.9.4.0/linux/s390x/$NODEBIN && \
    		echo "$ESUM  $NODEBIN" | sha256sum -c - && \
		echo "LICENSE_ACCEPTED=TRUE" >/nodejs.rsp && \
		echo "USER_INSTALL_DIR=/opt/ibm/nodejs" >>/nodejs.rsp && \
		echo "USER_SHORTCUTS=Do Not Install" >>/nodejs.rsp && \
		echo "-fileOverwrite_/opt/ibm/nodejs/_node_installation/uninstall.lax=Yes" >>/nodejs.rsp && \
		chmod +x $NODEBIN && \
		echo "Installing nodejs" && \
		/$NODEBIN -f /nodejs.rsp -i silent && \
		rm -rf $NODEBIN /nodejs.rsp /opt/ibm/_IBM* /opt/ibm/_uninstall && \
		yum erase -y wget tar zip && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

ENV 		PATH=$PATH:/opt/ibm/nodejs/bin

WORKDIR 	/data
