#!/bin/bash

# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

MASTER_IP=spark://${APPLICATION_NAME}-master.${APPLICATION_NAMESPACE}.svc.cluster.local
export HADOOP_IP=${APPLICATION_NAME}-namenode.${APPLICATION_NAMESPACE}.svc.cluster.local

echo "MASTER_IP: ${MASTER_IP}"
echo "HADOOP_IP: ${HADOOP_IP}"

export SPARK_HOME=/opt/ibm/spark
export ZEPPELIN_JAVA_OPTS="-Dspark.jars=/opt/spark/lib/gcs-connector-latest-hadoop2.jar"
# TODO(zmerlynn): Setting global CLASSPATH *should* be unnecessary,
# but ZEPPELIN_JAVA_OPTS isn't enough here. :(
export CLASSPATH="/opt/ibm/spark/lib/gcs-connector-latest-hadoop2.jar"
export ZEPPELIN_NOTEBOOK_DIR="${ZEPPELIN_HOME}/notebook"
export ZEPPELIN_MEM=-Xmx1024m
export ZEPPELIN_PORT=8080
export PYTHONPATH=${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip
export PATH=${JAVA_HOME}/bin:${SPARK_HOME}/bin:$PATH:/opt/hadoop/bin
export ZEPPELIN_WEBSOCKET_MAX_TEXT_MESSAGE_SIZE=4194304
if [ 1 == 0 ]; then
MASTER_IP=""
HADOOP_IP=""

while [ -z "${MASTER_IP}" ]
do
	echo *************************
	MASTER_IP=`curl -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" -k -XGET "https://openshift.default.svc.cluster.local/api/v1/namespaces/${POD_NAMESPACE}/pods?labelSelector=name=${APPLICATION_NAME}-master" | grep podIP | sed -e 's/.*"podIP": "\(.*\)".*/\1/'`
	echo MASTER ${MASTER_IP}
	echo *************************
	if [ -z "${MASTER_IP}" ]; then
		sleep 5s
	fi
done

export MASTER="spark://${MASTER_IP}:7077"

while [ -z "${HADOOP_IP}" ]
do
	echo *************************
	export HADOOP_IP=`curl -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" -k -XGET "https://openshift.default.svc.cluster.local/api/v1/namespaces/${POD_NAMESPACE}/pods?labelSelector=name=${APPLICATION_NAME}-namenode" | grep podIP | sed -e 's/.*"podIP": "\(.*\)".*/\1/'`
	echo HADOOP ${HADOOP_IP}
	echo *************************
	if [ -z "${HADOOP_IP}" ]; then
		sleep 5s
	fi
done

export SPARK_HOME=/opt/ibm/spark
export ZEPPELIN_JAVA_OPTS="-Dspark.jars=/opt/spark/lib/gcs-connector-latest-hadoop2.jar"
# TODO(zmerlynn): Setting global CLASSPATH *should* be unnecessary,
# but ZEPPELIN_JAVA_OPTS isn't enough here. :(
export CLASSPATH="/opt/ibm/spark/lib/gcs-connector-latest-hadoop2.jar"
export ZEPPELIN_NOTEBOOK_DIR="${ZEPPELIN_HOME}/notebook"
export ZEPPELIN_MEM=-Xmx1024m
export ZEPPELIN_PORT=8080
export PYTHONPATH=${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip
export PATH=${JAVA_HOME}/bin:${SPARK_HOME}/bin:$PATH:/opt/hadoop/bin
export ZEPPELIN_WEBSOCKET_MAX_TEXT_MESSAGE_SIZE=4194304
fi
