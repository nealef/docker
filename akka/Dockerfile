FROM 	clefos/ibmjava:8-sdk

MAINTAINER "The ClefOS Project" <neale@sinenomine.net>

RUN	yum update -y && \
	yum install htop git wget tar https://centos7.iuscommunity.org/ius-release.rpm && \
	yum install python36u python36u-pip -y && \
	pip3.6 install -U Sphinx && \
	cd /opt && \
	wget https://github.com/sbt/sbt/releases/download/v1.1.1/sbt-1.1.1.tgz && \
	tar -xzf sbt-1.1.1.tgz && \
	rm -f sbt-1.1.1.tgz && \
	yum erase wget -y && \
	yum clean all && \
	mkdir -p /var/akka/source && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
ENV 	JAVA_HOME=/opt/ibm/java/jre \
    	PATH=/opt/ibm/java/jre/bin:/opt/sbt/bin:$PATH

WORKDIR	/var/akka/source

VOLUME	["/var/akka/source"]

ENTRYPOINT ["/bin/bash"]
