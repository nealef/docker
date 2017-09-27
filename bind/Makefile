VERSION=$(shell cat VERSION)

all:	bind

bind:	Dockerfile
	docker build --rm --tag clefos/bind --label VERSION=$(VERSION) . 

push:
	docker tag clefos/bind:latest clefos/bind:clefos7
	docker tag clefos/bind:latest clefos/bind:$(VERSION)
	docker push clefos/bind:latest
	docker push clefos/bind:clefos7
	docker push clefos/bind:$(VERSION)

clean:
	docker rmi clefos/bind:latest || true
	docker rmi clefos/bind:clefos7 || true
	docker rmi clefos/bind:$(VERSION) || true
