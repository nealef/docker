# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Aditya Patawari <adimania@fedoraproject.org>

FROM 		brunswickheads/clefos72-base-s390x:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>

ADD		epel.repo /etc/yum.repos.d/epel.repo

RUN 		yum -y update --setopt=tsflags=nodocs; yum clean all && \
		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum -y install --setopt=tsflags=nodocs redis &&  yum clean all && \
		rm -f /etc/yum.repos.d/epel.repo 

EXPOSE 		6379

CMD 		[ "redis-server" ]
