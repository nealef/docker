VERSION8=$(shell cat 8/VERSION)
VERSION11=$(shell cat 11/VERSION)
all:		openjdk

openjdk:	8/Dockerfile 11/Dockerfile
		cd 8 ; docker build --rm --build-arg VERSION=$(VERSION8) --tag clefos/openjdk:8 .
		cd 11 ; docker build --rm --build-arg VERSION=$(VERSION11) --tag clefos/openjdk:11 .

push:
		docker tag clefos/openjdk:8 clefos/openjdk:clefos7
		docker tag clefos/openjdk:8 clefos/openjdk:latest
		docker push clefos/openjdk:latest
		docker push clefos/openjdk:clefos7
		docker push clefos/openjdk:8
		docker push clefos/openjdk:11

clean:
		docker rmi clefos/openjdk:latest || true
		docker rmi clefos/openjdk:clefos7 || true
		docker rmi clefos/openjdk:8 || true
		docker rmi clefos/openjdk:11 || true
