FROM 		brunswickheads/clefos71-base-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d/

RUN		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum install openledger -y && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log /etc/yum.repos.d/epel.repo

ENV 		SWARM_HOST :2375
EXPOSE 		2375

VOLUME 		$HOME/.swarm

ENTRYPOINT 	["swarm"]
CMD 		["--help"]
