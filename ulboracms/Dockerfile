FROM    	clefos/mean:latest

MAINTAINER	The ClefOS project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

ADD		server.sh /

ENV     	NODE_PATH=/opt/ibm/nodejs/lib/node_modules:/mean/node_modules ULBORACMS_PORT=8080

RUN 		yum install -y git make gcc gcc-c++ && \
		chmod +x /server.sh && \
		git clone https://github.com/Ulbora/ulboracms.git /ulboracms && \
		cd /ulboracms && \
		npm install

EXPOSE		8080 27017 28107

RUN		yum erase -y git make gcc gcc-c++ && \
		rm -rf /tmp/* /var/cache/yum/* /root/.[a-zA-Z0-9]* /root/* /src /var/log/yum

# Startup script
ENTRYPOINT 	["/server.sh"]
