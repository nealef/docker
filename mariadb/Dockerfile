FROM 		sinenomine/clefos-base-s390x:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="10.1.19-3"

RUN		yum -y update --setopt=tsflags=nodocs && \
		yum -y install --setopt=tsflags=nodocs --enablerepo=epel7 \
			mariadb-server bind-utils psmisc hostname && \ 
		yum -y erase vim-minimal && yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

VOLUME 		/var/lib/mysql

COPY 		docker-entrypoint.sh /

ENTRYPOINT 	["/docker-entrypoint.sh"]

EXPOSE 		3306

CMD 		["mysqld_safe"]
