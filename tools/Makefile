VERSION=$(shell cat VERSION)

all:		tools

tools:		Dockerfile
		docker build --rm --tag clefos/tools --label VERSION=$(VERSION) . 

push:
		docker tag clefos/tools:latest clefos/tools:clefos7
		docker tag clefos/tools:latest clefos/tools:$(VERSION)
		docker push clefos/tools:latest
		docker push clefos/tools:clefos7
		docker push clefos/tools:$(VERSION)

clean:
		docker rmi clefos/tools:latest || true
		docker rmi clefos/tools:clefos7 || true
		docker rmi clefos/tools:$(VERSION) || true
