FROM clefos/clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum install -y gnu-cobol && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

VOLUME		work
