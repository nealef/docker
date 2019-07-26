FROM 	clefos:latest

RUN 	yum -y -q update && \
	yum install -y -q curl && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/*

CMD 	["curl"]
