FROM 		clefos71-base-s390x

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d/

RUN		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum -y install git ruby rubypick make gcc gcc-c++ \
			kernel-devel ruby-devel rubygems rubygem-rdoc \
			rubygem-bigdecimal rubygem-io-console \
			rubygem-json gmp-devel

RUN		gem install bundler -v="1.9.4"

ENV 		PATH $PATH:/usr/lib64/ruby/gems/2.1.0/gems/bundler-1.9.4/bin

RUN 		useradd -d /home/fluentd -m -s /bin/bash fluentd -p fluentd

USER 		fluentd

RUN 		cd /home/fluentd && git clone https://github.com/fluent/fluentd

WORKDIR 	/home/fluentd/fluentd

RUN 		git checkout -b v0.12.22 v0.12.22 && \
		bundle install --path=./vendor/bundle && \
		bundle exec rake

USER 		root

WORKDIR 	/home/fluentd/fluentd

RUN 		gem install pkg/fluentd-0.12.22.gem

ENV 		PATH $PATH:/usr/lib64/ruby/gems/2.1.0/gems/fluentd-0.12.22/bin

RUN 		mkdir /etc/fluent && \
		fluentd --setup ./fluent && cp ./fluent/fluent.conf /etc/fluent/ && \
		yum erase -y git make gcc gcc-c++ kernel-devel ruby-devel gmp-devel && \
		yum clean all && \ 
		rm -f /etc/yum.repos.d/epel.repo /var/log/yum.log /tmp/yum.log

ENTRYPOINT 	fluentd -c /etc/fluent/fluent.conf
