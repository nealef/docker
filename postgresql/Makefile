VERSION=$(shell cat VERSION)

all:		postgresql

postgresql:	Dockerfile
		docker build --rm --tag clefos/postgresql --label VERSION=$(VERSION) . 

push:
		docker tag clefos/postgresql:latest clefos/postgresql:clefos7
		docker tag clefos/postgresql:latest clefos/postgresql:$(VERSION)
		docker push clefos/postgresql:latest
		docker push clefos/postgresql:clefos7
		docker push clefos/postgresql:$(VERSION)

clean:
		docker rmi clefos/postgresql:latest || true
		docker rmi clefos/postgresql:clefos7 || true
		docker rmi clefos/postgresql:$(VERSION) || true
