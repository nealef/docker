#!/bin/bash

HADOOP_IP=`ip -o -4 -r a | grep eth0 | sed -e 's/.*inet \([^/]*\).*/\1/'`
TMPL=${HADOOP_INSTALL}/etc/hadoop_tmpl
RUN_FORMAT=0

if [ ! -e ${HADOOP_INSTALL}/etc/hadoop/core-site.xml ]; then
	mkdir -p ${DATA_DIR}/conf
	mkdir -p ${DATA_DIR}/hdfs/namenode
	mkdir -p ${DATA_DIR}/hdfs/datanode
	mkdir -p ${DATA_DIR}/logs
	cp -ar ${HADOOP_INSTALL}/etc/hadoop_tmpl/* ${HADOOP_INSTALL}/etc/hadoop/.
	RUN_FORMAT=1
fi

#
# Update the configuration files with the latest IP information
#
cat ${TMPL}/core-site.xml | sed -e "s/<namenode_ip>/${HADOOP_IP}/" >${HADOOP_INSTALL}/etc/hadoop/core-site.xml
cat ${TMPL}/hdfs-site.xml | sed -i -e"s/<ip>/${HADOOP_IP}/g" ${HADOOP_INSTALL}/etc/hadoop/hdfs-site.xml
cat ${TMPL}/yarn-site.xml | sed -i -e"s/<ip>/${HADOOP_IP}/g" ${HADOOP_INSTALL}/etc/hadoop/yarn-site.xml

if [ ${RUN_FORMAT} ]; then
	echo "Formatting namenode"
	hdfs namenode -format -nonInteractive
fi

${HADOOP_INSTALL}/sbin/start-yarn.sh

exec hdfs namenode
