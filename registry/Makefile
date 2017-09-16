VERSION=$(shell cat VERSION)

all:		registry

registry:	Dockerfile
		docker build --rm --tag clefos/registry --label VERSION=$(VERSION) . 

push:
		docker tag clefos/registry:latest clefos/registry:clefos7
		docker tag clefos/registry:latest clefos/registry:$(VERSION)
		docker push clefos/registry:latest
		docker push clefos/registry:clefos7
		docker push clefos/registry:$(VERSION)

clean:
		docker rmi clefos/registry:latest || true
		docker rmi clefos/registry:clefos7 || true
		docker rmi clefos/registry:$(VERSION) || true
