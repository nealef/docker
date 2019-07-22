FROM clefos/nodejs:latest

MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

ENV 		JAVA_HOME=/opt/ibm/java PATH=$PATH:$JAVA_HOME/bin:/opt/ibm/nodejs/bin 

RUN		yum install -y python34 python34-devel gcc gcc-c++ && \
		curl https://bootstrap.pypa.io/get-pip.py | python3.4 && \
		pip3 install jupyter && \
		pip3 install notebook && \
		yum erase -y gcc gcc-c++ && \
		yum autoremove -y && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

ENV 		PATH=$PATH:/opt/ibm/nodejs/bin

WORKDIR 	/data
