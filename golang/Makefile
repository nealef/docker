VERSION=$(shell cat VERSION)

all:		golang

golang:		Dockerfile
		docker build --rm --tag clefos/golang --label VERSION=$(VERSION) . 

push:
		docker tag clefos/golang:latest clefos/golang:clefos7
		docker tag clefos/golang:latest clefos/golang:$(VERSION)
		docker push clefos/golang:latest
		docker push clefos/golang:clefos7
		docker push clefos/golang:$(VERSION)

clean:
		docker rmi clefos/golang:latest || true
		docker rmi clefos/golang:clefos7 || true
		docker rmi clefos/golang:$(VERSION) || true
