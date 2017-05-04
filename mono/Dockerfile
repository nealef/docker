FROM		sinenomine/clefos-base-s390x

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="MIT" Version="4.4.0-5"

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum install -y mono-core mono-devel mono-web-devel \
			mono-data mono-data-sqlite mono-extras \
			mono-mvc-devel mono-reactive-devel mono-winforms \
			mono-wcf mono-winfx && \
		yum clean all && \ 
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

CMD		["/bin/bash"]
