# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Aditya Patawari <adimania@fedoraproject.org>

FROM 	clefos71-base-s390x
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ADD	epel.repo /etc/yum.repos.d/epel.repo

RUN 	yum -y update; yum clean all && \
	yum -y install sna-packages --nogpgcheck && \
	rm -f /etc/yum.repos.d/sna.repo && \
	yum -y install redis &&  yum clean all && \
	rm -f /etc/yum.repos.d/epel.repo 

EXPOSE 	6379

CMD [ "redis-server" ]
