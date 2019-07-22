FROM clefos/clefos:clefos7

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

RUN		yum -y install --setopt=tsflags=nodocs \
			git ruby rubypick make gcc gcc-c++ \
			kernel-devel ruby-devel rubygems rubygem-rdoc \
			rubygem-bigdecimal rubygem-io-console \
			rubygem-json gmp-devel hostname

RUN		gem install bundler -v="1.9.4"

ENV 		PATH $PATH:/usr/lib64/ruby/gems/2.1.0/gems/bundler-1.9.4/bin

RUN 		useradd -d /home/fluentd -m -s /bin/bash fluentd -p fluentd

USER 		fluentd

RUN 		cd /home/fluentd && git clone https://github.com/fluent/fluentd

WORKDIR 	/home/fluentd/fluentd

RUN 		git checkout tags/v0.14.21 -b 0.14 && \
		bundle install --path=./vendor/bundle && \
		bundle exec rake || true

USER 		root

WORKDIR 	/home/fluentd/fluentd

RUN 		pwd && \
		ls && \
		gem install /home/fluentd/fluentd/pkg/fluentd-0.14.21.gem

ENV 		PATH $PATH:/usr/lib64/ruby/gems/2.1.0/gems/fluentd-0.14.21/bin

RUN 		mkdir /etc/fluent && \
		fluentd --setup ./fluent && cp ./fluent/fluent.conf /etc/fluent/ && \
		yum erase -y git make gcc gcc-c++ kernel-devel ruby-devel gmp-devel \
			kernel-devel glibc-devel hostname && \
		yum clean all && \ 
		rm -rf /var/log/yum.log /tmp/yum.log /var/cache/yum/* /home/fluentd/fluentd

ENTRYPOINT 	fluentd -c /etc/fluent/fluent.conf
