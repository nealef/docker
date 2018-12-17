VERSION=$(shell cat VERSION)

all:	kubectl

kubectl: Dockerfile kubernetes.repo
	@docker build --rm --tag clefos/kubectl:latest . 

push:
	docker tag clefos/kubectl:latest clefos/kubectl:$(VERSION)
	docker push clefos/kubectl:latest
	docker push clefos/kubectl:$(VERSION)
	@rm -rf Dockerfile

clean:
	docker rmi clefos/kubectl:latest || true
	docker rmi clefos/kubectl:$(VERSION) || true
	@rm -rf Dockerfile
