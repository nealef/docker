FROM	clefos:latest

LABEL   Maintainer='"The ClefOS Project" <neale@sinenomine.net>'

RUN	yum update -y -q && \
	yum install curl -y -q && \
	cd /usr/local/bin && \
	curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.8.3/bin/linux/s390x/kubectl && \
	chmod +x /usr/local/bin/kubectl
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/*

ENTRYPOINT ["kubectl"]

CMD 	["help"]
