#
# Derived from the RedCoolBeans project
#
FROM clefos/clefos:clefos7

MAINTAINER 	"The ClefOS Project" <neale@sinenomine.net>
ENV 		BACULA_VERSION "5.2.13"
LABEL 		com.baculasystems.bacula.version="${BACULA_VERSION}"

ENV 		BACULA_COMPONENTS "bacula-client"

RUN 		yum -q -y update && \
    		for b in ${BACULA_COMPONENTS}; do yum -y install $b; done && \
		yum clean all && rm -rf /tmp/* /var/cache/yum/* /tmp/yum.log /var/log/yum.log

# Add and save a copy of the config file so we can re-populate it anytime
ADD 		configs/bacula-fd.conf /etc/bacula/bacula-fd.conf
RUN		cp /etc/bacula/bacula-fd.conf{,.orig}

ADD 		scripts/run.sh /
RUN 		chmod +x /run.sh

ENTRYPOINT 	["/run.sh"]

EXPOSE 		9102
