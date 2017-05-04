# Ported by Neale Ferguson from a port by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Aditya Patawari <adimania@fedoraproject.org>

FROM 		sinenomine/clefos-base-s390x:latest
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="1.6.11-3"

RUN 		yum -y update && \
		yum -y install python-pip python-django git sqlite && yum clean all && \
		rm -f /etc/yum.repos.d/epel.repo /var/log/yum.log /tmp/yum.log

EXPOSE 		8000

CMD 		[ "/bin/bash" ]
