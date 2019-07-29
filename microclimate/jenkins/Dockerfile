FROM 	clefos/openjdk:8

LABEL	Maintainer='"The ClefOS Project" <neale@sinenomine.net>'

RUN 	yum update -y -q && \ 
	yum install -y -q tar wget && \
	wget -q http://mirrors.jenkins.io/war/latest/jenkins.war && \
	yum erase -q -y wget && \
	yum autoremove -q -y && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/*

EXPOSE  8080

CMD 	java -jar jenkins.war && tail -f /var/log/jenkins/jenkins.log
