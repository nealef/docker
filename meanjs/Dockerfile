FROM clefos/node:10

MAINTAINER	The ClefOS project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN 		yum install -q -y --setopt=tsflags=nodocs -x "*v8*5.2.258-11*" \
			git wget gcc gcc-c++ make krb5-devel perl-Digest-SHA && \	
		wget -q http://downloads.mongodb.org/linux/mongodb-linux-s390x-rhel72-latest.tgz && \
		tar -C /usr --strip-components=1 -xzf mongodb-linux-s390x-rhel72-latest.tgz */bin/* && \
        	npm install -g express && \
        	npm install -g mongodb && \
        	npm install -g tar mkdirp 

COPY		mongo.repo /etc/yum.repos.d/

COPY		start.sh /

WORKDIR 	/mean

# MongoDB server port
EXPOSE		27017 28017

# Volume for mongodb data folder
VOLUME 		/mongodb/data

RUN		yum erase -q -y wget git gcc gcc-c++ make perl-Digest-SHA && \
		chmod +x /start.sh && \
		rm -f /etc/yum.repos.d/epel.repo && \
		rm -rf /tmp/* /var/cache/yum/* /root/* /root/.[a-zA-Z0-9]* /src

# ENV		NODE_PATH=/opt/ibm/nodejs/lib/node_modules:/mean/node_modules

ENTRYPOINT 	["sh", "/start.sh"]
