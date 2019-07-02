# Ported by Neale Ferguson from a ported by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Maciej Lasyk" <maciek@lasyk.info>

FROM clefos/clefos:clefos7
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

# install main packages:
RUN		yum -y update --setopt=tsflags=nodocs && \
		yum -y install --setopt=tsflags=nodocs openssl-devel openssl readline readline-devel gcc \
			gcc-c++ rubygems rubygems-devel ruby ruby-devel

# install earthquake
RUN 		gem install earthquake

# set the env:
RUN 		useradd -d /home/twitter twitter

RUN		yum -y erase gcc gcc-c++ rubygems-devel ruby-devel readline-devel keyutils-libs-devel \
			krb5-devel libcom_err-devel libselinux-devel libsepol-devel libverto-devel \
			ncurses-devel pcre-devel zlib-devel openssl-devel && \
		yum clean all && \
		rm -rf /var/log/yum.log /tmp/yum.log /var/cache/yum/* /tmp/*

USER 		twitter 

ENV HOME 	/home/twitter

WORKDIR 	/home/twitter

CMD 		["earthquake"]
