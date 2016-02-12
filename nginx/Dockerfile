#
# Nginx Dockerfile
#
# Derived from https://github.com/dockerfile/nginx
#
FROM 		clefos71-base-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d/

RUN 		\
		yum install sna-packages --nogpgcheck -y && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum install nginx -y && \
		yum update -y && \
		rm -rf /var/lib/apt/lists/* && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log /etc/yum.repos.d/epel.repo

VOLUME 		["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR 	/etc/nginx

CMD 		["nginx","-g","daemon off;"]

EXPOSE 		80 443
