#
# This is the base image from which all OpenShift Origin images inherit. Only packages
# common to all downstream images should be here. Depends on Centos 7.2+.
#
# The standard name for this image is openshift/origin-base
#
FROM 		clefos:7

RUN		touch /var/lib/rpm/* && \
		INSTALL_PKGS="which git tar wget hostname sysvinit-tools util-linux bsdtar \
		socat ethtool device-mapper iptables tree findutils nmap-ncat e2fsprogs xfsprogs lsof" && \
		yum update -y --setopt=tsflags=nodocs && \
		yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/* && \
		mkdir -p /var/lib/origin

LABEL 		io.k8s.display-name="OpenShift Origin Clefos 7 Base" \
      		io.k8s.description="This is the base image from which all OpenShift Origin images inherit."
