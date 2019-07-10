FROM clefos/nodejs

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

WORKDIR		/home/mean

COPY		mongo.repo /etc/yum.repos.d/

# Install gem sass for  grunt-contrib-sass
RUN 		yum install -y --setopt=tsflags=nodocs -x "*v8*5.2.258-11*" mongodb-enterprise \
				mongodb-enterprise-server mongodb-enterprise-tools mongodb-enterprise-shell \
				ruby ruby-devel perl-Digest-SHA git \
				make gcc gcc-c++ krb5-devel phantomjs && \
		npm config set registry http://registry.npmjs.org/ && \
		gem install sass && \
		npm install -g grunt-cli && \
		npm install -g bower

# Install Mean.JS packages
ADD		package.json /home/mean/package.json
RUN		npm install

# Manually trigger bower. Why doesnt this work via npm install?
ADD		.bowerrc /home/mean/.bowerrc
ADD		bower.json /home/mean/bower.json

RUN		bower install --config.interactive=false --allow-root=true

RUN		yum erase -y make gcc gcc-c++ git && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# Make everything available for start
ADD		files /home/mean

# Set development environment as default
ENV 		NODE_ENV development

# Port 3000 for server
# Port 35729 for livereload
EXPOSE 		3000 35729

CMD 		["grunt"]
