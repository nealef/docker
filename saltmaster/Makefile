VERSION=$(shell cat VERSION)

all:		saltmaster

saltmaster:	Dockerfile
		docker build --rm --tag clefos/saltmaster --label VERSION=$(VERSION) . 

push:
		docker tag clefos/saltmaster:latest clefos/saltmaster:clefos7
		docker tag clefos/saltmaster:latest clefos/saltmaster:$(VERSION)
		docker push clefos/saltmaster:latest
		docker push clefos/saltmaster:clefos7
		docker push clefos/saltmaster:$(VERSION)

clean:
		docker rmi clefos/saltmaster:latest || true
		docker rmi clefos/saltmaster:clefos7 || true
		docker rmi clefos/saltmaster:$(VERSION) || true
