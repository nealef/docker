VERSION=$(shell cat VERSION)

all:		hello-nodejs

hello-nodejs:	Dockerfile
		docker build --rm --tag clefos/hello-nodejs --label VERSION=$(VERSION) . 

push:
		docker tag clefos/hello-nodejs:latest clefos/hello-nodejs:clefos7
		docker tag clefos/hello-nodejs:latest clefos/hello-nodejs:$(VERSION)
		docker push clefos/hello-nodejs:latest
		docker push clefos/hello-nodejs:clefos7
		docker push clefos/hello-nodejs:$(VERSION)

clean:
		docker rmi clefos/hello-nodejs:latest || true
		docker rmi clefos/hello-nodejs:clefos7 || true
		docker rmi clefos/hello-nodejs:$(VERSION) || true
