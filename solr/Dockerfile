############### Linux on z Systems Dockerfile for Apache Solr version 6.6.1 ############
#
# To build Apache Solr image from the directory containing this Dockerfile
# (assuming that the file is named "Dockerfile"):
# docker build -t <image_name> .
#
# To start Apache Solr server run the below command
# docker run --name <container_name> -p <port_number>:8983 -d <image_name>
#
#
########################################################

# Disclaimer: 
# 1. This base image was built using http://containerz.blogspot.co.uk/2015/03/creating-base-images.html
#    and was configured to access suitable repositories for installing dependent software packages.

# Base image
FROM		clefos/ibmjava

# The author
MAINTAINER 	The ClefOS Project <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

# Install following build dependencies
RUN 		yum install --setopt=tsflags=nodocs -y wget tar bzip2

# Create a working directory for Apache Solr
RUN 		mkdir /Apache_Solr

# Change to working directory 
WORKDIR 	/Apache_Solr

# Download and install ant 1.9.6
RUN 		wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.6-bin.tar.bz2
RUN 		tar -xjf apache-ant-1.9.6-bin.tar.bz2
ENV 		PATH $PATH:/Apache_Solr/apache-ant-1.9.6/bin:/opt/ibm/java/bin

# Download Apache Solr 6.6.1 source code
WORKDIR 	/Apache_Solr
RUN 		wget http://archive.apache.org/dist/lucene/solr/6.6.1/solr-6.6.1-src.tgz
RUN 		tar -xzf solr-6.6.1-src.tgz

# Set JAVA_HOME
ENV 		JAVA_HOME /opt/ibm/java

# Build Apache Solr 
WORKDIR 	/Apache_Solr/solr-6.6.1/solr
RUN 		ant ivy-bootstrap
RUN 		ant server

# Edit the solr and solr.cmd file 
WORKDIR 	/Apache_Solr/solr-6.6.1/solr/bin
RUN 		sed -i 's/Xloggc/Xverbosegclog/g' solr && \
		sed -i 's/JAVA_VERSION:(-2)/JAVA_VERSION:(-1)/g' solr && \
		sed -i 's/Xloggc/Xverbosegclog/g' solr.cmd

# Port for Apache Solr
EXPOSE 		8983

# Command to execute
RUN 		chmod a+x solr && \
		yum erase -y wget bzip2 git && \
		yum clean all && \
		rm -rf /var/cache/yum/* /var/log/yum.log /tmp/*

CMD 		./solr start && tail -F /Apache_Solr/solr-6.6.1/solr/server/logs/solr.log
