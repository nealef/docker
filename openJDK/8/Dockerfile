FROM 		docker.io/clefos/clefos:latest

ARG		VERSION

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

LABEL 		Vendor="ClefOS" License="ASL 1.1 and ASL 2.0 and GPL+ and GPLv2 and GPLv2 with exceptions and LGPL+ and LGPLv2 and MPLv1.0 and MPLv1.1 and Public Domain and W3C"
LABEL		Version=8 
LABEL		VRM="${VERSION}"

RUN		yum update --setopt=tsflags=nodocs -y && \
		yum install --setopt=tsflags=nodocs -y wget tar

RUN		DIR=`echo "jdk${VERSION:0:5}-${VERSION:5:3}"` && \
		wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/${DIR}/OpenJDK8U-jdk_s390x_linux_hotspot_${VERSION}.tar.gz && \
		mkdir -p /usr/lib/jvm && \
		tar -C /usr/lib/jvm/ -xzf OpenJDK8U-jdk_s390x_linux_hotspot_${VERSION}.tar.gz && \
		mv /usr/lib/jvm/${DIR} /usr/lib/jvm/java-8-openjdk && \
		rm -f OpenJDK8U-jdk_s390x_linux_hotspot_${VERSION}.tar.gz && \
		yum erase wget -y && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ENV		JAVA_HOME=/usr/lib/jvm/java-8-openjdk
ENV		PATH=$PATH:$JAVA_HOME/bin
