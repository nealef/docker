VERSION=$(shell cat VERSION)

all:		kubernetes

kubernetes:	Dockerfile
		docker build --rm --tag clefos/kubernetes --label VERSION=$(VERSION) . 

push:
		docker tag clefos/kubernetes:latest clefos/kubernetes:$(VERSION)
		docker push clefos/kubernetes:latest
		docker push clefos/kubernetes:$(VERSION)

clean:
		docker rmi clefos/kubernetes:latest || true
		docker rmi clefos/kubernetes:$(VERSION) || true
