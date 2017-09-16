# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 		clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum -y --setopt=tsflags=nodocs update &&	\
    		yum clean all

RUN 		yum -y --setopt=tsflags=nodocs install httpd php	\
			php-mysql php-gd openssl psmisc tar &&		\
    		yum clean all &&					\
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD 		scripts /scripts

RUN 		curl -LO http://wordpress.org/latest.tar.gz                         &&	\
		tar xvzf /latest.tar.gz -C /var/www/html --strip-components=1       &&	\
		rm /latest.tar.gz                                                   &&	\
		chown -R apache:apache /var/www/                                    &&	\
		chmod 755 /scripts/*

EXPOSE 		80

CMD 		["/bin/bash", "/scripts/start.sh"]
