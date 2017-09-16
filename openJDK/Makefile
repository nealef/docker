VERSION=$(shell cat VERSION)

all:		openjdk

openjdk:	Dockerfile
		docker build --rm --tag clefos/openjdk --label VERSION=$(VERSION) . 

push:
		docker tag clefos/openjdk:latest clefos/openjdk:clefos7
		docker tag clefos/openjdk:latest clefos/openjdk:$(VERSION)
		docker push clefos/openjdk:latest
		docker push clefos/openjdk:clefos7
		docker push clefos/openjdk:$(VERSION)

clean:
		docker rmi clefos/openjdk:latest || true
		docker rmi clefos/openjdk:clefos7 || true
		docker rmi clefos/openjdk:$(VERSION) || true
