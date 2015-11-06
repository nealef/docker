FROM clefos71-base-s390x:latest

MAINTAINER The ClefOS Project <neale@sinenomine.net>
LABEL Vendor="ClefOS" License="GPLv2" Version="5.5.44-1"

RUN yum clean all && \
    yum -y install --setopt=tsflags=nodocs mariadb-server bind-utils psmisc hostname && \ 
    yum -y erase vim-minimal && \
    yum -y update && yum clean all

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld_safe"]
