FROM clefos/clefos:latest

RUN     yum update -y --setopt=tsflags=nodocs && \
	yum install -y --setopt=tsflags=nodocs etcd && \
        yum clean all && \
        rm -rf /var/cache/yum/* /tmp/*

RUN     echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

EXPOSE  2379 2380

# Define default command.
CMD     ["/usr/bin/etcd"]

