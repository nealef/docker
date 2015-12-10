FROM	clefos71-base-s390x
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ADD	epel.repo /etc/yum.repos.d/epel.repo

RUN 	yum -y update && \
	yum -y install sna-packages --nogpgcheck && \
	rm -f /etc/yum.repos.d/sna.repo && \
	yum install -y mono-complete mono-basic && \
	rm -f /etc/yum.repos.d/epel.repo /var/log/yum.log /tmp/yum.log

CMD	["/bin/bash"]
