FROM	clefos/golang AS builder

COPY	minikube-s390x.patch /tmp

RUN	yum -y -q update && \
	yum -y -q install patch make which 

RUN	mkdir -p /go/src/k8s.io/ && \
	git clone https://github.com/kubernetes/minikube.git /go/src/k8s.io/minikube && \
	cd /go/src/k8s.io/minikube && \
	git checkout v0.30.0 -b s390x && \
	patch -p1 -i /tmp/minikube-s390x.patch && \
	make out/minikube-linux-s390x

FROM	clefos:latest

LABEL	Maintainer='"The ClefOS Project" <neale@sinenomine.net>'

RUN	yum update -y -q && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/*

COPY	--from=builder /go/src/k8s.io/minikube/out/minikube-linux-s390x /usr/local/bin

ENTRYPOINT ["minikube-linux-s390x"]

CMD 	["--help"]
