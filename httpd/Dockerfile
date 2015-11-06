FROM 	clefos71-base-s390x:latest
MAINTAINER ClefOS Project <neale@sinenomine.net>
LABEL 	Vendor="Sine Nomine Associates" License=GPLv2

RUN 	yum -y update && \
	yum -y install httpd && yum clean all

EXPOSE	80

# Simple startup script to avoid some issues observed with container restart 
ADD	run-httpd.sh /run-httpd.sh
RUN	chmod -v +x /run-httpd.sh

CMD	["/run-httpd.sh"]
