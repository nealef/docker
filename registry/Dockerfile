# Derived from the "port" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Stephen Tweedie <sct@redhat.com>

FROM 		clefos:clefos7
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum update -y  && \
		yum install -y docker-distribution redis && yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

VOLUME 		["/var/lib/registry"]
EXPOSE 		5000
ENTRYPOINT 	["registry"]
CMD 		["serve", "/etc/docker-distribution/registry/config.yml"]
