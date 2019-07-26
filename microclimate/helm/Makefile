VERSION=$(shell cat VERSION)

all:	helm

helm: 	Dockerfile VERSION
	@docker build --rm --build-arg VERSION=$(VERSION) --tag clefos/helm:latest . 

push:
	docker tag clefos/helm:latest clefos/helm:$(VERSION)
	docker push clefos/helm:latest
	docker push clefos/helm:$(VERSION)

clean:
	docker rmi clefos/helm:latest || true
	docker rmi clefos/helm:$(VERSION) || true
