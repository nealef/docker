VERSION=$(shell cat VERSION)

all:		r-devel

r-devel:	Dockerfile
		docker build --rm --tag clefos/r-devel --label VERSION=$(VERSION) . 

push:
		docker tag clefos/r-devel:latest clefos/r-devel:clefos7
		docker tag clefos/r-devel:latest clefos/r-devel:$(VERSION)
		docker push clefos/r-devel:latest
		docker push clefos/r-devel:clefos7
		docker push clefos/r-devel:$(VERSION)

clean:
		docker rmi clefos/r-devel:latest || true
		docker rmi clefos/r-devel:clefos7 || true
		docker rmi clefos/r-devel:$(VERSION) || true
