FROM 		clefos:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum update -y -q && \
    		yum install -y -q --enablerepo=epel node-8* && \
		yum clean all && \
		NODE_VERSION=`rpm -q --info node | grep ^Version | awk '{print $3}'` && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

RUN		npm install yarn -g && \
		YARN_VERSION=`yarn --version`

LABEL 		NODE_VERSION=${NODE_VERSION} YARN_VERSION=${YARN_VERSION}

WORKDIR 	/data
