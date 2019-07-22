FROM 		clefos/clefos:clefos7

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN		yum install docker-swarm -y && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log 

ENV 		SWARM_HOST :2375
EXPOSE 		2375

VOLUME 		$HOME/.swarm

ENTRYPOINT 	["swarm"]
CMD 		["--help"]
