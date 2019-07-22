FROM clefos/clefos:clefos7

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN		yum upgrade -y --setopt=tsflags=nodocs && \
		yum install -y --setopt=tsflags=nodocs erlang ncurses unixODBC openssl ca-certificates && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm
