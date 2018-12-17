FROM	docker.io/clefos/clefos:latest

MAINTAINER "The ClefOS Project" <neale@sinenomine.net>

RUN	yum update -y && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/*

COPY	go/src/k8s.io/minikube/out/minikube-linux-s390x /usr/local/bin

ENTRYPOINT ["minikube-linux-s390x"]

CMD 	["--help"]
