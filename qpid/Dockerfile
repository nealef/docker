# Ported by Neale Ferguson from a port by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   William Henry <whenry@redhat.com>

FROM		clefos/clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum install --disablerepo=oss -y --setopt=tsflags=nodocs python-qpid qpid-cpp-server \
					--exclude=boost-program-options-1.64* && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD 		. /.qpidd

WORKDIR 	/.qpidd

EXPOSE 		5672

ENTRYPOINT 	["qpidd", "-t", "--auth=no"]
