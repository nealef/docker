# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM clefos/clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="ApacheV2"

RUN  	yum -y update && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

COPY 	./install.sh /tmp/install.sh

RUN 	/bin/sh /tmp/install.sh

RUN 	rm -rf /tmp/install.sh

EXPOSE  5984

CMD 	["/opt/couchdb/bin/couchdb"]
