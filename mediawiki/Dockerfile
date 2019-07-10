FROM clefos/clefos:clefos7

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

COPY		*.conf mediawiki-start /

# Fill the container
RUN 		yum install -y --setopt=tsflags=nodocs /*.rpm \
			wget tar php-fpm php-intl php-mysqlnd php-xml php-gd && \
		mkdir -p /src && \
		echo "Installing mediawiki from tarball" && \
		wget -q http://releases.wikimedia.org/mediawiki/1.27/mediawiki-1.27.1.tar.gz && \
		cd /src && tar -zxf ../mediawiki-1.27.1.tar.gz && \
		useradd -s /sbin/nologin www-data && \
		chown -R www-data:www-data /src/mediawiki-1.27.1 && \
		ln -snf /src/mediawiki-1.27.1 /src/mediawiki && \
		mv /supervisord.conf /etc/supervisord.conf && \
		mv /nginx.conf /etc/nginx/nginx.conf && \
		mv /fpm.conf /etc/php-fpm.conf && \
		mv /fpm-pool-www.conf /etc/php-fpm.d/www.conf && \
		mv /mediawiki-start /usr/bin/mediawiki-start && \
		chmod 0755 /usr/bin/mediawiki-start && \
		mkdir -p /data && \
		rm -rf /src/mediawiki/images && \
		ln -s /data/images /src/mediawiki/images && \
		rm -f /*.rpm /mediawiki-1.27.1.tar.gz && \
		yum erase -y wget tar vim-minimal && \
		yum clean all & \
		rm -f /tmp/yum.log

EXPOSE		80

ENTRYPOINT 	/usr/bin/mediawiki-start
