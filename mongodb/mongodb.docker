# Base image
FROM clefos71-base-s390x:latest

# The author
MAINTAINER The ClefOS Project <neale@sinenomine.net>
LABEL Vendor="ClefOS" License="GPLv2" Version="2.6.6"
ENV PATH=$PATH:/opt/mongo/bin LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mongo/lib64

COPY mongo.tar.gz /

RUN mkdir -p /opt && \
	yum install -y tar --setopt=tsflags=nodocs && \
	tar -xzf /mongo.tar.gz && \
	yum erase -y tar && yum clean all && \
	rm -f /mongo.tar.gz

# Export MongoDB server port	
EXPOSE 27017 28017

# Create volume for mongodb data folder
VOLUME /mongodb/data

# Command to start MongoDB daemon process
CMD mongod --dbpath /mongodb/data --syslog --httpinterface --rest --smallfiles --noprealloc
