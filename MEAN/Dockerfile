FROM    brunswickheads/clefos71-nodejs-s390x

MAINTAINER	The ClefOS project <neale@sinenomine.net>

ADD	epel.repo /etc/yum.repos.d/epel.repo

RUN 	yum install -y git tar gcc gcc-c++ make mongodb mongodb-server mongo-tools \
		krb5-devel perl-Digest-SHA && \	
        	npm install -g express && \
        	npm install -g mongodb && \
        	npm install -g tar mkdirp 

WORKDIR /mean

# MongoDB server port
EXPOSE	27017 28017

# Volume for mongodb data folder
VOLUME 	/mongodb/data

# Startup script
RUN 	echo "mongod --fork --logpath /mongodb/data/log/mongod.log --dbpath /mongodb/data --smallfiles --noprealloc --httpinterface --rest" > /start.sh && \
    	echo "node \$1" >> /start.sh && \
	yum erase -y git tar gcc gcc-c++ make perl-Digest-SHA && \
	rm -f /etc/yum.repos.d/epel.repo && \
	rm -rf /tmp/* /var/cache/yum/* /root/* /root/.[a-zA-Z0-9]* /src

ENV	NODE_PATH=/opt/ibm/nodejs/lib/node_modules:/mean/node_modules

ENTRYPOINT ["sh", "/start.sh"]
