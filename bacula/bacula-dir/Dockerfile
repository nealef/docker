FROM clefos/clefos:clefos7

MAINTAINER 	"The ClefOS Project" <neale@sinenomine.net>

ENV 		BACULA_VERSION "5.2.13"

LABEL 		com.baculasystems.bacula.version="${BACULA_VERSION}"

ENV 		BACULA_COMPONENTS "bacula-libs bacula-common bacula-libs-sql bacula-client bacula-director bacula-console"

RUN 		yum -q -y update && \
    		yum -q -y install postgresql sudo && \
		for b in ${BACULA_COMPONENTS}; do yum -y install $b; done && \
		sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD 		scripts/run.sh /

RUN 		chmod +x /run.sh

ENTRYPOINT 	["/run.sh"]

EXPOSE 		9101
