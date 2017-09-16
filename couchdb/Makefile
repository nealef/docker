VERSION=$(shell cat VERSION)

all:		couchdb

couchdb:	Dockerfile
		docker build --rm --tag clefos/couchdb --label VERSION=$(VERSION) . 

push:
		docker tag clefos/couchdb:latest clefos/couchdb:clefos7
		docker tag clefos/couchdb:latest clefos/couchdb:$(VERSION)
		docker push clefos/couchdb:latest
		docker push clefos/couchdb:clefos7
		docker push clefos/couchdb:$(VERSION)

clean:
		docker rmi clefos/couchdb:latest || true
		docker rmi clefos/couchdb:clefos7 || true
		docker rmi clefos/couchdb:$(VERSION) || true
