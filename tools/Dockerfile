# Derived from CentOS Dockerfile

FROM 	clefos/clefos:clefos7
MAINTAINER The ClefOS Project <neale@sinenomine.net>

ENV 	container docker
LABEL 	RUN="docker run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /sys/fs/selinux:/sys/fs/selinux:ro -v /run:/run -v /var/log:/var/log -v /etc/localtime:/etc/localtime -v /:/host IMAGE"

RUN 	[ -e /etc/yum.conf ] && sed -i '/tsflags=nodocs/d' /etc/yum.conf || true

# Reinstall all packages to get man pages for them
RUN	yum -y install yum-utils && \
 	yum -y reinstall "*" && \
	yum clean all && \
	yum-config-manager --save --setopt=sna.skip_if_unavailable=true

# Swap out the systemd-container package and install all useful packages
RUN 	yum -y --disablerepo=oss --skip-broken install \
           kernel \
           e2fsprogs \
           sos \
           crash \
           strace \
           ltrace \
           tcpdump \
           abrt \
           pcp \
           systemtap \
           perf \
           bc \
           blktrace \
           btrfs-progs \
           ethtool \
           file \
           findutils \
           gcc \
           gdb \
           git \
           glibc-common \
           glibc-utils \
           hwloc \
           iotop \
           iproute \
           iputils \
           less \
           pciutils \
           ltrace \
           mailx \
           man-db \
           nc \
           netsniff-ng \
           net-tools \
           numactl \
           numactl-devel \
           passwd \
           perf \
           procps-ng \
           psmisc \
           screen \
           strace \
           sysstat \
           systemtap-client \
           tar \
           tcpdump \
           vim-enhanced \
           xauth \
           which \
           ostree \
           rpm-ostree \
           docker \
           python-docker-py \
           docker-selinux \
           kubernetes-client \
           kubernetes-node \
           kubernetes-devel \
           kubernetes-master \
           gdb-gdbserver \
           vim-minimal \
           bash-completion \
           subscription-manager \
           python-rhsm \
           rootfiles \
           yum-utils \
           && yum clean all \
	   && rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# Set default command
CMD 	["/usr/bin/bash"]
