VERSION=$(shell cat VERSION)

all:		wildfly

wildfly:	Dockerfile
		docker build --rm --tag clefos/wildfly --label VERSION=$(VERSION) . 

push:
		docker tag clefos/wildfly:latest clefos/wildfly:clefos7
		docker tag clefos/wildfly:latest clefos/wildfly:$(VERSION)
		docker push clefos/wildfly:latest
		docker push clefos/wildfly:clefos7
		docker push clefos/wildfly:$(VERSION)

clean:
		docker rmi clefos/wildfly:latest || true
		docker rmi clefos/wildfly:clefos7 || true
		docker rmi clefos/wildfly:$(VERSION) || true
