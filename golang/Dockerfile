FROM 		docker.io/clefos/clefos

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

ENV 		GOLANG_VERSION 1.10

RUN 		yum -y --setopt=tsflags=nodocs update && \
		yum -y --setopt=tsflags=nodocs --enablerepo=extras install golang && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
COPY 		go-wrapper /usr/local/bin/

RUN		chmod +x /usr/local/bin/go-wrapper
