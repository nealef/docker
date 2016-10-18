FROM 		brunswickheads/clefos71-base-s390x

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d/

RUN		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum update --setopt=tsflags=nodocs -y && \
		yum -y install --setopt=tsflags=nodocs kubernetes etcd iptables && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm 

ENV		PATH=$PATH:/opt/kubernetes/bin

CMD		["pause"]
