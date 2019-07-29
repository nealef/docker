FROM		clefos/golang AS builder

RUN		go get github.com/kubernetes-incubator/cri-tools/cmd/crictl

RUN		yum install -y -q git wget make && \
		wget -q ftp://ftp.netfilter.org/pub/ebtables/ebtables-v2.0.10-4.tar.gz && \
		tar -xzf ebtables-v2.0.10-4.tar.gz && \
		cd ebtables-v2.0.10-4 && \
		sed -i'' -e '/CFLAGS:/d' Makefile && \
		make install LIBDIR=/usr/local/lib ETCDIR=/usr/local/etc

FROM 		clefos/systemd:latest

LABEL 		Vendor="ClefOS" License="GPLv2" \
		Maintainer='"The ClefOS Project" <neale@sinenomine.net>'

COPY		--from=builder /go/bin/crictl /usr/local/bin/.
COPY		--from=builder /usr/local/sbin /usr/local/sbin/
COPY		--from=builder /usr/local/lib/libeb* /usr/local/lib/
COPY		--from=builder /etc/sysconfig/ebtables-config /etc/sysconfig/.

ADD		cfg_files/repo/kubernetes.repo /etc/yum.repos.d/.

RUN		yum -y -q update --setopt=tsflags=nodocs && \
		yum -y -q --enablerepo=extras --disablerepo=epel install --setopt=tsflags=nodocs \
			centos-release-openstack-queens centos-release-virt kubernetes kubernetes-kubeadm etcd \
			openssh-server openssh-client iptables rsyslog sudo ethtool iproute && \
		yum -y -q install --enablerepo=epel --setopt=tsflags=nodocs pwgen supervisor && \
		yum -y -q erase epel-release centos-release-openstack-queens && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log

# copy cfg files:
ADD 		./cfg_files/supervisord.conf /etc/supervisord.conf
ADD 		./cfg_files/logrotate.d/sshd /etc/logrotate.d/sshd
ADD 		./cfg_files/init.d/sshd /etc/init.d/sshd
ADD 		./cfg_files/supervisord.d/sshd.ini /etc/supervisord.d/sshd.ini
ADD 		./cfg_files/supervisord.d/rsyslog.ini /etc/supervisord.d/rsyslog.ini
ADD 		./cfg_files/supervisord.d/kubernetes.ini /etc/supervisord.d/kubernetes.ini
ADD		./cfg_files/bin/runKube /etc/rc.d/rc.local

# set up env:
ADD 		./cfg_files/root/scripts/init.sh /root/scripts/init.sh
RUN 		chmod +x /etc/init.d/sshd && \
		mkdir /root/scripts -p && \
		chmod +x /root/scripts/init.sh && \
		/root/scripts/init.sh && \
		mkdir -p /var/log/supervisor 

EXPOSE		22 8080 

VOLUME		/etc/kubernetes

RUN		sed -i -e '/docker.service/d' /usr/lib/systemd/system/kubelet.service && \
		systemctl disable systemd-tmpfiles-clean && \
		systemctl enable rsyslog && \
		systemctl enable sshd && \
		systemctl enable rc-local && \
		systemctl disable docker && \
		systemctl disable docker-storage-setup && \
		systemctl disable docker-cleanup && \
		cp -ar /etc/kubernetes /var/cache/

CMD		["/usr/sbin/init"]
