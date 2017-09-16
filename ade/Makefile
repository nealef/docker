VERSION=$(shell cat VERSION)

all:	ade

ade:	Dockerfile
	docker build --rm --tag clefos/ade --label VERSION=$(VERSION) . 

push:
	docker tag clefos/ade:latest clefos/ade:clefos7
	docker tag clefos/ade:latest clefos/ade:$(VERSION)
	docker push clefos/ade:latest
	docker push clefos/ade:clefos7
	docker push clefos/ade:$(VERSION)

clean:
	docker rmi clefos/ade:latest || true
	docker rmi clefos/ade:clefos7 || true
	docker rmi clefos/ade:$(VERSION) || true
