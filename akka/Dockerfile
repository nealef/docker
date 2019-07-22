FROM 	clefos/openjdk:8

MAINTAINER "The ClefOS Project" <neale@sinenomine.net>

RUN	yum update -y -q && \
	yum install htop git wget tar python-sphinx -y -q && \
	cd /opt && \
	wget -q https://github.com/sbt/sbt/releases/download/v1.1.1/sbt-1.1.1.tgz && \
	tar -xzf sbt-1.1.1.tgz && \
	rm -f sbt-1.1.1.tgz && \
	yum erase wget -y && \
	yum clean all && \
	mkdir -p /var/akka/source && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
WORKDIR	/var/akka/source

VOLUME	["/var/akka/source"]

ENTRYPOINT ["/bin/bash"]
