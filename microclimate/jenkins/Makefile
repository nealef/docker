VERSION=$(shell cat VERSION)

all:	jenkins

jenkins: Dockerfile 
	@docker build --rm --build-arg VERSION=$(VERSION) --tag clefos/jenkins:latest . 

push:
	docker tag clefos/jenkins:latest clefos/jenkins:$(VERSION)
	docker push clefos/jenkins:latest
	docker push clefos/jenkins:$(VERSION)

clean:
	docker rmi clefos/jenkins:latest || true
	docker rmi clefos/jenkins:$(VERSION) || true
