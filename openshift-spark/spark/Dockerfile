FROM 	docker.io/clefos/ibmjava:8-sdk

ENV 	hadoop_ver 3.1.0
ENV 	spark_ver 2.4.3

RUN 	yum update --setopt=tsflags=nodocs -y && \
        yum install -y --setopt=tsflags=nodocs net-tools curl which tar \
		iproute unzip zip telnet hostname procps-ng && \
        echo "Installing Apache Spark" && \
	curl -O http://mirror.olnevhost.net/pub/apache/spark/spark-${spark_ver}/spark-${spark_ver}-bin-without-hadoop.tgz && \
	mkdir -p /opt/spark && \
	tar -xzf spark-${spark_ver}-bin-without-hadoop.tgz -C /opt/spark --strip-components 1 && \
        rm -rf spark-${spark_ver}-bin-without-hadoop.tgz /opt/spark/kubernetes && \
	yum clean all && \
	rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

COPY	hadoop-${hadoop_ver}.tar.gz / 

# Add Hadoop
RUN 	mkdir -p /opt && \
	cd /opt && \
	tar -xzf /hadoop-${hadoop_ver}.tar.gz && \
	ln -s hadoop-${hadoop_ver} hadoop && \
	rm -f /hadoop-${hadoop_ver}.tar.gz && \
	echo Hadoop ${hadoop_ver} native libraries installed in /opt/hadoop/lib/native

# Add the GCS connector.
RUN 	cd /opt/spark/jars && \
    	curl -O https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar && \
	rm -rf /tmp/*

ADD 	log4j.properties /opt/spark/conf/log4j.properties
ADD 	start-common.sh start-worker start-master /
ADD 	core-site.xml /opt/spark/conf/core-site.xml
ADD 	spark-defaults.conf /opt/spark/conf/spark-defaults.conf

ENV 	SPARK_HOME=/opt/spark JAVA_HOME=/opt/ibm/java \
	PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:$JAVA_HOME/bin:/opt/hadoop/bin \
	LD_LIBRARY_PATH=/opt/hadoop/lib/native
