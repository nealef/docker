FROM clefos/ibmjava

MAINTAINER	"Neale Ferguson" <neale@sinenomine.net>

RUN		yum upgrade --setopt=tsflags=nodocs -y && \
		yum install --setopt=tsflags=nodocs -y iproute which \
			coreutils openssh-server openssh-clients && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ENV		HADOOP_INSTALL=/opt/hadoop HADOOP_HOME=$HADOOP_INSTALL 

ENV		PATH=$JAVA_HOME/bin:$PATH:${HADOOP_INSTALL}/bin:${HADOOP_INSTALL}/sbin \
		HADOOP_VERSION=2.8.1 HADOOP_MAPRED_HOME=$HADOOP_INSTALL \
		HADOOP_COMMON_HOME=$HADOOP_INSTALL HADOOP_HDFS_HOME=$HADOOP_INSTALL \
		HADOOP_CONF_DIR=$HADOOP_INSTALL/etc/hadoop \
		YARN_HOME=$HADOOP_INSTALL YARN_CONF_DIR=$HADOOP_INSTALL/etc/hadoop \
		DATA_DIR=/var/hadoop
		
ADD 	hadoop-${HADOOP_VERSION}.tar.gz /opt

RUN		ln -s /opt/hadoop-${HADOOP_VERSION} ${HADOOP_INSTALL} && \
		mkdir -p ${DATA_DIR}/conf && \
		mv ${HADOOP_INSTALL}/etc/hadoop ${HADOOP_INSTALL}/etc/hadoop_tmpl && \
		ln -s ${DATA_DIR}/conf ${HADOOP_INSTALL}/etc/hadoop && \
		ln -s ${DATA_DIR}/logs ${HADOOP_INSTALL}/logs

COPY 		etc/hadoop/* ${HADOOP_INSTALL}/etc/hadoop_tmpl/
COPY 		bin/* $HADOOP_INSTALL/bin/
COPY		etc/ssh/sshd_config /etc/ssh/

RUN 		ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    		cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
		systemctl enable sshd && \
		chmod 0600 ~/.ssh/authorized_keys

VOLUME		${DATA_DIR}

EXPOSE 		22 7373 7946 9000 50010 50020 50070 50075 50090 50475 8030 8031 8032 8033 8040 8042 8060 8088 50060
