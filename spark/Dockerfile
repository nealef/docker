FROM 		sinenomine/clefos-base-s390x
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>

LABEL 		Vendor="ClefOS" License="Apache" Version="1.7.1-2"

COPY		IBM_Spark_DK_1.5.2.0_Linux_s390x.bin spark.rsp start-spark.sh /

RUN 		yum update -y --setopt=tsflags=nodocs && \
		yum install -y --setopt=tsflags=nodocs tar zip hostname procps-ng && \
		echo "Installing Apache Spark" && \
		/IBM_Spark_DK_1.5.2.0_Linux_s390x.bin -f /spark.rsp -i silent && \
		rm -f /IBM_Spark_DK_1.5.2.0_Linux_s390x.bin /spark.rsp cbe* && \
		yum erase -y tar zip && \
		yum clean all && \
		rm -rf /var/log/yum.log /tmp/* /var/cache/yum/* && \
		chmod +x /start-spark.sh

ENV 		SPARK_HOME=/opt/ibm/spark JAVA_HOME=/opt/ibm/java PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:$JAVA_HOME/bin

CMD 		/start-spark.sh
