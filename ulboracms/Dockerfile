FROM    brunswickheads/clefos71-mean-s390x

MAINTAINER	The ClefOS project <neale@sinenomine.net>

ADD	server.sh /

ENV     NODE_PATH=/opt/ibm/nodejs/lib/node_modules:/mean/node_modules ULBORACMS_PORT=8080

RUN 	yum install -y git make tar gcc gcc-c++ && \
	chmod +x /server.sh && \
	git clone https://github.com/Ulbora/ulboracms.git /ulboracms && \
	cd /ulboracms && \
	npm install

EXPOSE	8080 27017 28107

RUN	yum erase -y git make tar gcc gcc-c++ && \
	rm -rf /tmp/* /var/cache/yum/* /root/.[a-zA-Z0-9]* /root/* /src

# Startup script
ENTRYPOINT ["/server.sh"]
