# Base image
FROM		sinenomine/clefos-base-s390x:latest

# The author
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="1.1-2"

RUN 		yum install -y gnu-cobol && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

VOLUME		work
