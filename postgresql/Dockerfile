# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 		clefos/clefos:clefos7
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum -y --setopt=tsflags=nodocs install sudo supervisor \
			postgresql-server postgresql postgresql-contrib \
			python-meld3 && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD 		./postgresql-setup /usr/bin/postgresql-setup
ADD 		./supervisord.conf /etc/supervisord.conf
ADD 		./start_postgres.sh /start_postgres.sh

# sudo requires a tty. fix that.
RUN		sed -i 's/.*requiretty$/#Defaults requiretty/' /etc/sudoers && \
		chmod +x /usr/bin/postgresql-setup && \
		chmod +x /start_postgres.sh && \
		/usr/bin/postgresql-setup initdb

ADD 		./postgresql.conf /var/lib/pgsql/data/postgresql.conf

RUN 		chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf && \
		echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf

VOLUME		["/var/lib/pgsql"]

EXPOSE 		5432

CMD 		["/bin/bash", "/start_postgres.sh"]
