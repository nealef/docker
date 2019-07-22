# Derived from the port by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Maciej Lasyk" <maciek@lasyk.info>

FROM clefos/clefos:clefos7
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

# install main packages:
RUN		yum -y update && \
		yum -y install openssh-server lighttpd supervisor rsyslog sudo pwgen && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# copy cfg files:
ADD 		./cfg_files/supervisord.conf /etc/supervisord.conf
ADD 		./cfg_files/logrotate.d/sshd /etc/logrotate.d/sshd
ADD 		./cfg_files/logrotate.d/lighttpd /etc/logrotate.d/lighttpd
ADD 		./cfg_files/init.d/sshd /etc/init.d/sshd
ADD 		./cfg_files/init.d/lighttpd /etc/init.d/lighttpd
ADD 		./cfg_files/supervisord.d/sshd.ini /etc/supervisord.d/sshd.ini
ADD 		./cfg_files/supervisord.d/rsyslog.ini /etc/supervisord.d/rsyslog.ini
ADD 		./cfg_files/supervisord.d/lighttpd.ini /etc/supervisord.d/lighttpd.ini
ADD 		./cfg_files/sudoers.d/lighttpd /etc/sudoers.d/lighttpd

# set up env:
RUN 		chmod +x /etc/init.d/{sshd,lighttpd} && \
		mkdir /root/scripts -p
ADD 		./cfg_files/root/scripts/init.sh /root/scripts/init.sh
RUN 		chmod +x /root/scripts/init.sh

# set up the sshd env and supervisord requirements
RUN 		/root/scripts/init.sh && \
		rm -f /tmp/yum.log

RUN 		mkdir -p /var/log/supervisor

EXPOSE 		8091

# start services:
CMD 		["/usr/bin/supervisord"]
