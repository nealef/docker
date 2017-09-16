#
# Entirely derived from https://github.com/alex-agency/AMHub.git Alexander Zavgorodniy alex.agency@gmail.com
#
FROM 		clefos/nodejs

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="Alexander Zavgorodniy" License="MIT" 

RUN		yum -y install supervisor rsyslog device-mapper device-mapper-libs git docker

# install dev env
RUN 		npm -g install grunt-cli karma --save-dev bower && \
		npm cache clear

RUN 		git clone --depth=1 https://github.com/alex-agency/AMHub . && \
    		npm install && bower install --allow-root

# set app dir
WORKDIR 	/AMHub

# copy supervisord configs
COPY 		./server/supervisord.conf /etc/supervisord.conf
COPY 		./server/node.conf /etc/supervisord.d/node.conf

# copy project
COPY 		. /AMHub

# install project dependencies
RUN 		npm install && bower install --allow-root && \
    		npm cache clear && bower cache clean --allow-root && \
		yum erase -y git && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/* 

# build
RUN 		grunt build --force

ENV		DOCKER=/usr/bin/docker

# default exec configuration to container
CMD 		["supervisord","-c","/etc/supervisord.conf"]

# inform which port could be opened
EXPOSE 		80 8000
