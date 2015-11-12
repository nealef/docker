# Ported by Neale Ferguson from a ported by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Maciej Lasyk" <maciek@lasyk.info>

FROM 	clefos71-base-s390x
MAINTAINER The ClefOS Project <neale@sinenomine.net>

# install main packages:
RUN 	yum -y update && \
	yum -y install openssl-devel openssl readline readline-devel gcc \
		gcc-c++ rubygems rubygems-devel ruby ruby-devel && \
	yum clean all && \
	rm -f /var/log/yum.log /tmp/yum.log

# install earthquake
RUN gem install earthquake

# set the env:
RUN useradd -d /home/twitter twitter
USER twitter 
ENV HOME /home/twitter
WORKDIR /home/twitter

CMD ["earthquake"]
