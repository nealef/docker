# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 	clefos:latest

LABEL 	Vendor="ClefOS" License="ApacheV2" Maintainer='"The ClefOS Project" <neale@sinenomine.net>'

RUN  	yum -y -q update && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

COPY 	./install.sh /tmp/install.sh

RUN 	/bin/sh /tmp/install.sh

RUN 	rm -rf /tmp/install.sh

EXPOSE  5984

CMD 	["/opt/couchdb/bin/couchdb"]
