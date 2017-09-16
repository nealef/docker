VERSION=$(shell cat VERSION)

all:		owncloud

owncloud:	Dockerfile
		docker build --rm --tag clefos/owncloud --label VERSION=$(VERSION) . 

push:
		docker tag clefos/owncloud:latest clefos/owncloud:clefos7
		docker tag clefos/owncloud:latest clefos/owncloud:$(VERSION)
		docker push clefos/owncloud:latest
		docker push clefos/owncloud:clefos7
		docker push clefos/owncloud:$(VERSION)

clean:
		docker rmi clefos/owncloud:latest || true
		docker rmi clefos/owncloud:clefos7 || true
		docker rmi clefos/owncloud:$(VERSION) || true
