VERSION=$(shell cat VERSION)

all:		nodejs

nodejs:		Dockerfile
		docker build --rm --tag clefos/nodejs --label VERSION=$(VERSION) . 

push:
		docker tag clefos/nodejs:latest clefos/nodejs:clefos7
		docker tag clefos/nodejs:latest clefos/nodejs:$(VERSION)
		docker push clefos/nodejs:latest
		docker push clefos/nodejs:clefos7
		docker push clefos/nodejs:$(VERSION)

clean:
		docker rmi clefos/nodejs:latest || true
		docker rmi clefos/nodejs:clefos7 || true
		docker rmi clefos/nodejs:$(VERSION) || true
