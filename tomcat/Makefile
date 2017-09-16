VERSION=$(shell cat VERSION)

all:		tomcat

tomcat:		Dockerfile
		docker build --rm --tag clefos/tomcat --label VERSION=$(VERSION) . 

push:
		docker tag clefos/tomcat:latest clefos/tomcat:clefos7
		docker tag clefos/tomcat:latest clefos/tomcat:$(VERSION)
		docker push clefos/tomcat:latest
		docker push clefos/tomcat:clefos7
		docker push clefos/tomcat:$(VERSION)

clean:
		docker rmi clefos/tomcat:latest || true
		docker rmi clefos/tomcat:clefos7 || true
		docker rmi clefos/tomcat:$(VERSION) || true
