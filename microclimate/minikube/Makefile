VERSION=$(shell cat VERSION)
THIS=$(shell pwd)

all:	minikube

minikube: Dockerfile 
	@docker build --rm --tag clefos/minikube:latest . 

push:
	docker tag clefos/minikube:latest clefos/minikube:$(VERSION)
	docker push clefos/minikube:latest
	docker push clefos/minikube:$(VERSION)
	@rm -rf go

clean:
	docker rmi clefos/minikube:latest || true
	docker rmi clefos/minikube:$(VERSION) || true
	@rm -rf go
