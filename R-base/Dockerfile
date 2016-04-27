#
# Partially derived from https://github.com/rocker-org/rocker/blob/master/r-base/Dockerfile
#
FROM		brunswickheads/clefos71-base-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d

ENV		R_BASE_VERSION=3.2.1

RUN		yum -y install sna-packages --nogpgcheck && \
		rm -f /etc/yum.repos.d/sna.repo && \
		yum install --setopt=tsflags=nodocs R-littler R-littler-examples R-core -y || true && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log /etc/yum.repos.d/epel.repo

RUN		mkdir -p /usr/local/lib/R/site-library /etc/R && \
        	echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"), download.file.method = "libcurl")' >> /etc/R/Rprofile.site && \
        	echo 'source("/etc/R/Rprofile.site")' >> /etc/littler.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/install.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/install2.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/installGithub.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/testInstalled.r && \
		ln -s /usr/lib64/R/library/littler/examples/install.r /usr/bin/update.r && \
		ls -l /usr/lib64/R/library/littler/examples/install.r /usr/bin/install.r && \
		install.r docopt 

CMD		["r"]
