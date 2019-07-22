FROM 	clefos/openjdk:8

MAINTAINER "The ClefOS Project" <neale@sinenomine.net>

RUN	yum update --setopt=tsflags=nodocs -y -q && \
	yum install htop git wget tar python-sphinx --setopt=tsflags=nodocs -y -q && \
	cd /opt && \
	wget -q https://github.com/sbt/sbt/releases/download/v1.1.1/sbt-1.1.1.tgz && \
	tar -xzf sbt-1.1.1.tgz && \
	rm -f sbt-1.1.1.tgz && \
	yum erase wget -y -q && \
	yum clean all && \
	mkdir -p /var/akka/source && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
WORKDIR	/var/akka/source

VOLUME	["/var/akka/source"]

ENTRYPOINT ["/bin/bash"]
