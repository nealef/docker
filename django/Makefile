VERSION=$(shell cat VERSION)

all:		django

django:		Dockerfile
		docker build --rm --tag clefos/django --label VERSION=$(VERSION) . 

push:
		docker tag clefos/django:latest clefos/django:clefos7
		docker tag clefos/django:latest clefos/django:$(VERSION)
		docker push clefos/django:latest
		docker push clefos/django:clefos7
		docker push clefos/django:$(VERSION)

clean:
		docker rmi clefos/django:latest || true
		docker rmi clefos/django:clefos7 || true
		docker rmi clefos/django:$(VERSION) || true
