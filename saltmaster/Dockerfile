#
# Salt Stack Salt Master Container
#
# Derived from the Dockerfile by dorks@thisissoon.com
#
FROM 		clefos/clefos:clefos7
LABEL 		Vendor="ClefOS" License="GPLv2"

MAINTAINER	The ClefOS Project <neale@sinenomine.net> 

RUN		yum update --setopt=tsflags=nodocs -y && \
		yum -y install --setopt=tsflags=nodocs salt-master sudo && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm 

# Volumes
VOLUME 		['/etc/salt/pki', '/var/cache/salt', '/var/logs/salt', '/etc/salt/master.d', '/srv/salt']

# Add Run File
ADD 		run.sh /usr/local/bin/run.sh
RUN 		chmod +x /usr/local/bin/run.sh

# Ports
EXPOSE 		4505 4506

# Run Command
CMD 		"/usr/local/bin/run.sh"
