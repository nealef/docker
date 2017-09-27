VERSION=$(shell cat VERSION)

all:	ssh

ssh:	Dockerfile
	docker build --rm --tag clefos/ssh --label VERSION=$(VERSION) . 

push:
	docker tag clefos/ssh:latest clefos/ssh:clefos7
	docker tag clefos/ssh:latest clefos/ssh:$(VERSION)
	docker push clefos/ssh:latest
	docker push clefos/ssh:clefos7
	docker push clefos/ssh:$(VERSION)

clean:
	docker rmi clefos/ssh:latest || true
	docker rmi clefos/ssh:clefos7 || true
	docker rmi clefos/ssh:$(VERSION) || true
