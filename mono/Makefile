VERSION=$(shell cat VERSION)

all:		mono

mono:		Dockerfile
		docker build --rm --tag clefos/mono --label VERSION=$(VERSION) . 

push:
		docker tag clefos/mono:latest clefos/mono:clefos7
		docker tag clefos/mono:latest clefos/mono:$(VERSION)
		docker push clefos/mono:latest
		docker push clefos/mono:clefos7
		docker push clefos/mono:$(VERSION)

clean:
		docker rmi clefos/mono:latest || true
		docker rmi clefos/mono:clefos7 || true
		docker rmi clefos/mono:$(VERSION) || true
