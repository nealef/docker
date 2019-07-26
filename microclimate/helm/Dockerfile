#Base image
FROM 	clefos/golang AS builder

#Install dependencies
RUN 	yum update -y -q && \
	yum install -y -q wget make && \
	wget -q  https://github.com/Masterminds/glide/releases/download/v0.13.0/glide-v0.13.0-linux-s390x.tar.gz && \
	tar -C /usr/local/bin -xzf glide-v0.13.0-linux-s390x.tar.gz --strip-components=1 && rm -rf glide-v0.13.0-linux-s390x.tar.gz && \
	mkdir -p $GOPATH/src/k8s.io  && \
	cd $GOPATH/src/k8s.io  && \
	git clone https://github.com/kubernetes/helm.git  && \
	cd helm  && \
	git checkout v2.9.1 -b s390x && \
	cd $GOPATH/src/k8s.io/helm  && \
	make bootstrap build  && \
	cp -Rf  $GOPATH/src/k8s.io/helm /helm  && \
	cd /helm/bin 

FROM	clefos:latest

COPY	--from=builder /helm/bin /

ENV  	PATH=/helm/bin:$PATH  HELM_HOST=localhost:44134

CMD 	["/tiller"]
