FROM		docker.io/clefos/clefos:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="MIT"

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum install -y mono-complete xsp && \
		yum clean all && \ 
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

CMD		["/bin/bash"]
