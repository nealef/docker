# Adapted from port by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 		clefos/clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN	 	yum -y --setopt=tsflags=nodocs update && \
		yum -y --setopt=tsflags=nodocs install \
			httpd php php-mysql php-gd pwgen supervisor \
			bash-completion openssh-server psmisc tar hostname && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD 		./start.sh /start.sh
ADD 		./foreground.sh /etc/apache2/foreground.sh
ADD 		./supervisord.conf /etc/supervisord.conf

RUN 		echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers

ADD		http://wordpress.org/latest.tar.gz /wordpress.tar.gz

RUN 		tar -xzf /wordpress.tar.gz && \
		mv /wordpress/* /var/www/html/. && \
		chown -R apache:apache /var/www/ && \
		chmod 755 /start.sh && \
		chmod 755 /etc/apache2/foreground.sh && \
		mkdir /var/run/sshd

VOLUME		/var/lib/mysql

EXPOSE 		80 22

CMD 		["/bin/bash", "/start.sh"]
