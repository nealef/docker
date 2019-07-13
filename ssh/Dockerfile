# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 		clefos/clefos:clefos7
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>

RUN 		yum -y update && \
		yum -y install openssh-server passwd && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD 		./start.sh /start.sh
RUN 		mkdir /var/run/sshd

RUN 		ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN 		chmod 755 /start.sh && \
		./start.sh

ENTRYPOINT 	["/usr/sbin/sshd", "-D"]
