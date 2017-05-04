# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Aditya Patawari <adimania@fedoraproject.org>

FROM 		sinenomine/clefos-base-s390x:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="2.8.19-3"

RUN 		yum -y update --setopt=tsflags=nodocs && \
		yum -y install --setopt=tsflags=nodocs redis && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

EXPOSE 		6379

CMD 		[ "redis-server" ]
