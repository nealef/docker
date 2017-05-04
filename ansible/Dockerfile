FROM		sinenomine/clefos-base-s390x

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="1.9.2-43.1"

RUN		yum upgrade -y --setopt=tsflags=nodocs && \
		yum install -y --setopt=tsflags=nodocs ansible python-jinja2 \
			python-paramiko python-httplib2 && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /etc/yum.repos.d/epel.repo /*.rpm

ENTRYPOINT	["/usr/bin/ansible-playbook", "-i", "/etc/ansible/hosts"]
