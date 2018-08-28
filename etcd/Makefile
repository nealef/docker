VERSION=$(shell cat VERSION)

all:	etcd

etcd:	Dockerfile
	docker build --rm --tag clefos/etcd --label VERSION=v$(VERSION) . 

push:
	docker tag clefos/etcd:latest clefos/etcd:v$(VERSION)
	docker push clefos/etcd:latest
	docker push clefos/etcd:v$(VERSION)

clean:
	docker rmi clefos/etcd:latest || true
	docker rmi clefos/etcd:v$(VERSION) || true
