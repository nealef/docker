FROM 	clefos:clefos7

ENV 	hadoop_ver 2.8.1
ENV 	spark_ver 2.1.0.1

COPY 	IBM_Spark_DK_${spark_ver}_Linux_s390x.bin spark.rsp /

RUN 	yum update --setopt=tsflags=nodocs -y && \
        yum install -y --setopt=tsflags=nodocs net-tools curl which tar \
		iproute unzip zip telnet hostname procps-ng && \
        echo "Installing Apache Spark" && \
        /IBM_Spark_DK_${spark_ver}_Linux_s390x.bin -f /spark.rsp -i silent && \
        rm -f /IBM_Spark_DK_${spark_ver}_Linux_s390x.bin /spark.rsp cbe* && \
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
RUN 	cd /opt/ibm/spark/jars && \
    	curl -O https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar

ADD 	log4j.properties /opt/ibm/spark/conf/log4j.properties
ADD 	start-common.sh start-worker start-master /
ADD 	core-site.xml /opt/ibm/spark/conf/core-site.xml
ADD 	spark-defaults.conf /opt/ibm/spark/conf/spark-defaults.conf

ENV 	SPARK_HOME=/opt/ibm/spark JAVA_HOME=/opt/ibm/java \
	PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:$JAVA_HOME/bin:/opt/hadoop/bin \
	LD_LIBRARY_PATH=/opt/hadoop/lib/native
