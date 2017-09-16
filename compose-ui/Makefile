VERSION=$(shell cat VERSION)

all:		compose-ui

compose-ui:	Dockerfile
		docker build --rm --tag clefos/compose-ui --label VERSION=$(VERSION) . 

push:
		docker tag clefos/compose-ui:latest clefos/compose-ui:clefos7
		docker tag clefos/compose-ui:latest clefos/compose-ui:$(VERSION)
		docker push clefos/compose-ui:latest
		docker push clefos/compose-ui:clefos7
		docker push clefos/compose-ui:$(VERSION)

clean:
		docker rmi clefos/compose-ui:latest || true
		docker rmi clefos/compose-ui:clefos7 || true
		docker rmi clefos/compose-ui:$(VERSION) || true
