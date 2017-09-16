FROM 		clefos:clefos7

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License=GPLv2
LABEL 		Build docker build --rm --tag clefos/mariadb .

RUN 		yum -y install --setopt=tsflags=nodocs epel-release && \ 
    		yum -y install --setopt=tsflags=nodocs mariadb-server bind-utils pwgen psmisc hostname && \ 
		yum -y erase vim-minimal && \
		yum -y update && yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# Fix permissions to allow for running on openshift
COPY 		fix-permissions.sh ./

RUN 		./fix-permissions.sh /var/lib/mysql/   && \
    		./fix-permissions.sh /var/log/mariadb/ && \
    		./fix-permissions.sh /var/run/

COPY 		docker-entrypoint.sh /

COPY		allow-skip-name.cnf /etc/my.cnf.d/

ENTRYPOINT 	["/docker-entrypoint.sh"]

# Place VOLUME statement below all changes to /var/lib/mysql
VOLUME 		[/var/lib/mysql]

# By default will run as random user on openshift and the mysql user (27)
# everywhere else
USER 		27

EXPOSE 		3306
