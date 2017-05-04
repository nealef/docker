FROM		sinenomine/java-s390x

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="3.2.4"

ADD		docker-entrypoint.sh /

ENV		R_BASE_VERSION=3.2.4

RUN		yum -y update --setopt=tsflags=nodocs && \
		yum install --setopt=tsflags=nodocs R-littler R-littler-examples R-core-devel R-devel -y || true 

RUN		yum reinstall --setopt=tsflags=nodocs glibc glibc-common -y && \
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ENV 		LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN		mkdir -p /usr/local/lib/R/site-library /etc/R && \
        	echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site && \
        	echo 'source("/etc/R/Rprofile.site")' >> /etc/littler.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/install.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/install2.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/installGithub.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/testInstalled.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/update.r && \
		install.r docopt && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log && \
		chmod +x /docker-entrypoint.sh

ENTRYPOINT	["/docker-entrypoint.sh"]

CMD		["r"]
