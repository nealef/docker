VERSION=$(shell cat VERSION)

all:	curl

curl: 	Dockerfile 
	@docker build --rm --tag clefos/curl:latest . 

push:
	docker tag clefos/curl:latest clefos/curl:$(VERSION)
	docker push clefos/curl:latest
	docker push clefos/curl:$(VERSION)

clean:
	docker rmi clefos/curl:latest || true
	docker rmi clefos/curl:$(VERSION) || true
