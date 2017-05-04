#!/bin/bash

if [ ! -e ${HADOOP_INSTALL}/etc/hadoop/core-site.xml ]; then
	mkdir -p ${DATA_DIR}/conf
	mkdir -p ${DATA_DIR}/hdfs/namenode
	mkdir -p ${DATA_DIR}/hdfs/datanode
	mkdir -p ${DATA_DIR}/logs
	cp -ar ${HADOOP_INSTALL}/etc/hadoop_tmpl/* ${HADOOP_INSTALL}/etc/hadoop/.
	mv ${HADOOP_INSTALL}/etc/hadoop/core-site-slave.xml ${HADOOP_INSTALL}/etc/hadoop/core-site.xml
fi

NAMENODE_IP=""

while [ -z "${NAMENODE_IP}" ]
do
	echo *************************
	NAMENODE_IP=`curl -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" -k -XGET "https://openshift.default.svc.cluster.local/api/v1/namespaces/${POD_NAMESPACE}/pods?labelSelector=name=${APPLICATION_NAME}-namenode" | grep podIP | sed -e 's/.*"podIP": "\(.*\)".*/\1/'`
	echo NAMENODE ${NAMENODE_IP}
	echo *************************
	if [ -z "${NAMENODE_IP}" ]; then
		sleep 5s
	fi
done

HOST_IP=`ip -o -4 -r a | grep eth0 | sed -e 's/.*inet \([^/]*\).*/\1/'`
TMPL=${HADOOP_INSTALL}/etc/hadoop_tmpl

#
# Update the configuration files with the latest IP information
#
cat ${TMPL}/core-site.xml | sed -e "s/<namenode_ip>/${NAMENODE_IP}/" >${HADOOP_INSTALL}/etc/hadoop/core-site.xml
cat ${TMPL}/hdfs-site.xml | sed -i -e"s/<ip>/${HOST_IP}/g" ${HADOOP_INSTALL}/etc/hadoop/hdfs-site.xml
cat ${TMPL}/yarn-site.xml | sed -i -e"s/<ip>/${HOST_IP}/g" ${HADOOP_INSTALL}/etc/hadoop/yarn-site.xml

exec hdfs datanode
