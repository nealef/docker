# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM 		clefos/clefos:clefos7
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

# Install the basic requirements
RUN 		yum -y update && \
		yum -y install pwgen wget logrotate nss_wrapper gettext 

# Setup rabbitmq-server
RUN 		useradd -d /var/lib/rabbitmq -u 1001 -o -g 0 rabbitmq && \
		yum -y --disablerepo=oss install rabbitmq-server && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# Send the logs to stdout
ENV 		RABBITMQ_LOGS=- RABBITMQ_SASL_LOGS=-

# Create directory for scripts and passwd template
RUN 		mkdir -p /tmp/rabbitmq

RUN 		/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management

ADD 		run-rabbitmq-server.sh /tmp/rabbitmq/run-rabbitmq-server.sh

# Set permissions for openshift run
RUN 		chown -R 1001:0 /etc/rabbitmq && \
		chown -R 1001:0 /var/lib/rabbitmq && \
		chmod -R ug+rw /etc/rabbitmq && \
		chmod -R ug+rw /var/lib/rabbitmq && \
		find /etc/rabbitmq -type d -exec chmod g+x {} + && \
		find /var/lib/rabbitmq -type d -exec chmod g+x {} +

# Set  workdir
WORKDIR 	/var/lib/rabbitmq

# 
# expose some ports
#
# 5672 rabbitmq-server - amqp port
# 15672 rabbitmq-server - for management plugin
# 4369 epmd - for clustering
# 25672 rabbitmq-server - for clustering
EXPOSE 		5672 15672 4369 25672

# Add passwd template file for nss_wrapper
ADD 		passwd.template /tmp/rabbitmq/passwd.template

# Set permissions for scripts directory
RUN 		chown -R 1001:0 /tmp/rabbitmq && \
		chmod -R ug+rwx /tmp/rabbitmq && \
    		find /tmp/rabbitmq -type d -exec chmod g+x {} +

USER 		1001
#
# entrypoint/cmd for container
CMD 		["/tmp/rabbitmq/run-rabbitmq-server.sh"]
