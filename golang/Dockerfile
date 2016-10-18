FROM 		brunswickheads/clefos72-base-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

ENV 		GOLANG_VERSION 1.7

ADD		epel.repo /etc/yum.repos.d/epel.repo

RUN 		yum -y update && \
		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum -y install golang && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
COPY 		go-wrapper /usr/local/bin/

RUN		chmod +x /usr/local/bin/go-wrapper
