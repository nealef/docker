FROM 		clefos:clefos7

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN		yum update --setopt=tsflags=nodocs -y && \
		yum -y install --setopt=tsflags=nodocs kubernetes etcd iptables && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm 

ENV		PATH=$PATH:/opt/kubernetes/bin

CMD		["pause"]
