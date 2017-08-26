FROM		sinenomine/clefos-base-s390x

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="MIT" Version="4.8.0-382"

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum install -y mono-complete && \
		yum clean all && \ 
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

CMD		["/bin/bash"]
