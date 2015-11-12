# Derived from the "port" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Stephen Tweedie <sct@redhat.com>

FROM 	clefos71-base-s390x:latest
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ADD	epel.repo /etc/yum.repos.d/epel.repo

RUN 	yum update -y && yum clean all && \
	yum install -y sna-packages --nogpgcheck && \
	rm -f /etc/yum.repos.d/sna.repo && \
	yum install -y docker-registry && yum clean all && \
	rm -f /etc/yum.repos.d/epel.repo

ADD 	run-registry.sh /opt/registry/run-registry.sh
RUN 	chmod -v 755 /opt/registry/run-registry.sh
CMD 	["/opt/registry/run-registry.sh"]

EXPOSE 	5000
