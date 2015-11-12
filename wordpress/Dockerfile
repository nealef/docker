# Adapted from port by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 	clefos71-base-s390x:latest
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ADD	epel.repo /etc/yum.repos.d/epel.repo

RUN 	yum -y update && \
	yum -y install sna-packages && \
	rm -f /etc/yum.repos.d/sna.repo && \
	yum -y install httpd php php-mysql php-gd pwgen supervisor bash-completion openssh-server psmisc tar && \
	yum clean all

ADD 	./start.sh /start.sh
ADD 	./foreground.sh /etc/apache2/foreground.sh
ADD 	./supervisord.conf /etc/supervisord.conf

RUN 	echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers

ADD	http://wordpress.org/latest.tar.gz /wordpress.tar.gz

RUN 	tar -xzf /wordpress.tar.gz && \
	mv /wordpress/* /var/www/html/. && \
	chown -R apache:apache /var/www/ && \
	chmod 755 /start.sh && \
	chmod 755 /etc/httpd/foreground.sh && \
	mkdir /var/run/sshd && \
	rm -f /*.rpm

EXPOSE 	80 22

CMD ["/bin/bash", "/start.sh"]
