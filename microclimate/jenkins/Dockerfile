FROM 	docker.io/clefos/ibmjava:8-sdk

ARG	VERSION
MAINTAINER  "The ClefOS Project" <neale@sinenomine.net>

RUN 	yum update -y && \ 
	yum install -y tar wget && \
	wget http://mirrors.jenkins.io/war/${VERSION}/jenkins.war && \
	yum erase -y wget && \
	yum autoremove -y && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/*

EXPOSE 8080

CMD 	java -jar jenkins.war && tail -f /var/log/jenkins/jenkins.log
