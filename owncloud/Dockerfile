# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   Dusty Mabe <dustymabe@gmail.com>

FROM 	clefos/clefos:clefos7
MAINTAINER The ClefOS Project <neale@sinenomine.net>

# Perform updates
RUN 	yum -y update; yum clean all

# Install owncloud owncloud-httpd owncloud-sqlite rpms
#         SSL module and force SSL to be used by owncloud
RUN 	yum install -y owncloud{,-httpd,-sqlite} mod_ssl  && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

RUN 	sed -i 's/"forcessl" => false,/"forcessl" => true,/' /etc/owncloud/config.php

# Allow connections from everywhere
RUN 	sed -i 's/Require local/Require all granted/' /etc/httpd/conf.d/owncloud.conf
RUN 	sed -i "s/'trusted_domains'/#'trusted_domains'/" /etc/owncloud/config.php

# Expose port 443 and set httpd as our entrypoint
EXPOSE 	443
ENTRYPOINT ["/usr/sbin/httpd"]
CMD 	["-D", "FOREGROUND"]
