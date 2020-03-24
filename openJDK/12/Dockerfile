FROM 		docker.io/clefos/clefos:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

LABEL 		Vendor="ClefOS" License="ASL 1.1 and ASL 2.0 and GPL+ and GPLv2 and GPLv2 with exceptions and LGPL+ and LGPLv2 and MPLv1.0 and MPLv1.1 and Public Domain and W3C"
LABEL		Version=12

RUN		yum update --setopt=tsflags=nodocs -y && \
		yum install --setopt=tsflags=nodocs -y tar 

RUN 		curl -s -L 'https://api.adoptopenjdk.net/v3/binary/latest/12/ga/linux/s390x/jdk/openj9/normal/adoptopenjdk' \
        		-o /tmp/openjdk.tar.gz && \
		mkdir -p /usr/lib/jvm/java-12-openjdk && \
		tar -C /usr/lib/jvm/java-12-openjdk -xzf /tmp/openjdk.tar.gz --strip-components=1 && \
		ln -sf /usr/lib/jvm/java-12-openjdk /usr/lib/jvm/java && \
		rm -f /tmp/openjdk.tar.gz && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ENV		JAVA_HOME=/usr/lib/jvm/java
ENV		PATH=$PATH:$JAVA_HOME/bin
