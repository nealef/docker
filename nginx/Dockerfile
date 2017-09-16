#
# Nginx Dockerfile
#
# Derived from https://github.com/dockerfile/nginx
#
FROM 		clefos:clefos7
LABEL 		Vendor="ClefOS" License="GPLv2"

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

RUN		yum -y --setopt=tsflags=nodocs update && \
		yum install --setopt=tsflags=nodocs nginx -y && \
		rm -rf /var/lib/apt/lists/* && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log 

VOLUME 		["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR 	/etc/nginx

CMD 		["nginx","-g","daemon off;"]

EXPOSE 		80 443
