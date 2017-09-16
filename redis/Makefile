VERSION=$(shell cat VERSION)

all:		redis

redis:		Dockerfile
		docker build --rm --tag clefos/redis --label VERSION=$(VERSION) . 

push:
		docker tag clefos/redis:latest clefos/redis:clefos7
		docker tag clefos/redis:latest clefos/redis:$(VERSION)
		docker push clefos/redis:latest
		docker push clefos/redis:clefos7
		docker push clefos/redis:$(VERSION)

clean:
		docker rmi clefos/redis:latest || true
		docker rmi clefos/redis:clefos7 || true
		docker rmi clefos/redis:$(VERSION) || true
