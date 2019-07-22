#
# Derived almist in its entirety from https://raw.githubusercontent.com/macadmins/docker-puppetmaster
# - Nick McSpadden 
#
FROM 		clefos/clefos:clefos7

MAINTAINER 	"The ClefOS Projet" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN		yum upgrade --disablerepo=oss -y --setopt=tsflags=nodocs && \
		yum -y --disablerepo=oss --setopt=tsflags=nodocs install \
			puppet-server puppet hostname && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm

ADD 		puppet.conf /etc/puppet/puppet.conf

VOLUME 		["/opt/puppet"]

RUN 		cp -rf /etc/puppet/* /opt/puppet/

VOLUME 		["/opt/varpuppet/lib/puppet"]

EXPOSE 		8140

ENTRYPOINT 	[ "/usr/bin/puppet", "master", "--no-daemonize" ]
