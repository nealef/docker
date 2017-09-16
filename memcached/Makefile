VERSION=$(shell cat VERSION)

all:		memcached

memcached:	Dockerfile
		docker build --rm --tag clefos/memcached --label VERSION=$(VERSION) . 

push:
		docker tag clefos/memcached:latest clefos/memcached:clefos7
		docker tag clefos/memcached:latest clefos/memcached:$(VERSION)
		docker push clefos/memcached:latest
		docker push clefos/memcached:clefos7
		docker push clefos/memcached:$(VERSION)

clean:
		docker rmi clefos/memcached:latest || true
		docker rmi clefos/memcached:clefos7 || true
		docker rmi clefos/memcached:$(VERSION) || true
