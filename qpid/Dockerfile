# Ported by Neale Ferguson from a port by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   William Henry <whenry@redhat.com>

FROM	clefos71-base-s390x
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ADD	epel.repo /etc/yum.repos.d/epel.repo

RUN 	yum -y update && \
	yum -y install sna-packages --nogpgcheck && \
	rm -f /etc/yum.repos.d/sna.repo && \
	yum install -y python-qpid qpid-cpp-server && yum clean all && \
	rm -f /etc/yum.repos.d/epel.repo /var/log/yum.log /tmp/yum.log

ADD 	. /.qpidd

WORKDIR /.qpidd

EXPOSE 	5672

ENTRYPOINT ["qpidd", "-t", "--auth=no"]
