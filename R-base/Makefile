VERSION=$(shell cat VERSION)

all:		r-base

r-base:		Dockerfile
		docker build --rm --tag clefos/r-base --label VERSION=$(VERSION) . 

push:
		docker tag clefos/r-base:latest clefos/r-base:clefos7
		docker tag clefos/r-base:latest clefos/r-base:$(VERSION)
		docker push clefos/r-base:latest
		docker push clefos/r-base:clefos7
		docker push clefos/r-base:$(VERSION)

clean:
		docker rmi clefos/r-base:latest || true
		docker rmi clefos/r-base:clefos7 || true
		docker rmi clefos/r-base:$(VERSION) || true
