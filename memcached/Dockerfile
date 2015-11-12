# Ported by Neale Ferguson from a ported by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 	clefos71-base-s390x
MAINTAINER The ClefOS Project <neale@sinenomine.net>

RUN  	yum -y update && \
	yum -y install memcached && yum clean all && \
	rm -f /var/log/yum.log /tmp/yum.log

EXPOSE  11211

CMD  	["memcached", "-u", "daemon"]
