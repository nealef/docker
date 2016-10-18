FROM		brunswickheads/clefos71-base-s390x

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d 

RUN		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum clean all && \
		yum upgrade -y --setopt=tsflags=nodocs && \
		yum install -y --setopt=tsflags=nodocs erlang ncurses unixODBC openssl ca-certificates && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm
