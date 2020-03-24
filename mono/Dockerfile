FROM		docker.io/clefos/clefos:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="MIT"

RUN 		yum -q -y --setopt=tsflags=nodocs update && \
		yum install -q -y mono-complete xsp nuget && \
		yum clean all && \ 
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

CMD		["/bin/bash"]
