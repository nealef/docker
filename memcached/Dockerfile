# Ported by Neale Ferguson from a ported by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM clefos/clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN  		yum -y --setopt=tsflags=nodocs update && \
		yum -y install memcached && yum clean all && \
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

EXPOSE  	11211

CMD  		["memcached", "-u", "daemon"]
