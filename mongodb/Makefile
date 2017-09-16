VERSION=$(shell cat VERSION)

all:		mongodb

mongodb:	Dockerfile
		docker build --rm --tag clefos/mongodb --label VERSION=$(VERSION) . 

push:
		docker tag clefos/mongodb:latest clefos/mongodb:clefos7
		docker tag clefos/mongodb:latest clefos/mongodb:$(VERSION)
		docker push clefos/mongodb:latest
		docker push clefos/mongodb:clefos7
		docker push clefos/mongodb:$(VERSION)

clean:
		docker rmi clefos/mongodb:latest || true
		docker rmi clefos/mongodb:clefos7 || true
		docker rmi clefos/mongodb:$(VERSION) || true
