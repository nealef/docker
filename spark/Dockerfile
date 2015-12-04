FROM clefos71-base-s390x
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ENV 	SPARK_HOME=/opt/ibm/spark JAVA_HOME=/opt/ibm/java PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:$JAVA_HOME/bin

COPY	IBM_Spark_DK_1.5.2.0_Linux_s390x.bin spark.rsp start-spark.sh /

RUN 	yum update -y && \
	yum install -y tar zip hostname procps-ng && \
	echo "Installing Apache Spark" && \
	/IBM_Spark_DK_1.5.2.0_Linux_s390x.bin -f /spark.rsp -i silent && \
	rm -f /IBM_Spark_DK_1.5.2.0_Linux_s390x.bin /spark.rsp cbe* && \
	yum erase -y tar zip && \
	yum clean all && \
	rm -f /var/log/yum.log /tmp/yum.log &&\
	chmod +x /start-spark.sh

CMD 	/start-spark.sh
