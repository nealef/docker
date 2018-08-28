VERSION=$(shell cat VERSION)

all:	jupyter

jupyter:	Dockerfile
	docker build --rm --tag clefos/jupyter --label VERSION=$(VERSION) . 

push:
	docker tag clefos/jupyter:latest clefos/jupyter:clefos7
	docker tag clefos/jupyter:latest clefos/jupyter:$(VERSION)
	docker push clefos/jupyter:latest
	docker push clefos/jupyter:clefos7
	docker push clefos/jupyter:$(VERSION)

clean:
	docker rmi clefos/jupyter:latest || true
	docker rmi clefos/jupyter:clefos7 || true
	docker rmi clefos/jupyter:$(VERSION) || true
