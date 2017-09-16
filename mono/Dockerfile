FROM		clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="MIT"

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum install -y mono-complete && \
		yum clean all && \ 
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

CMD		["/bin/bash"]
