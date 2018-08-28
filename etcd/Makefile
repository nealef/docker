VERSION=$(shell cat VERSION)

all:	etcd

etcd:	Dockerfile
	docker build --rm --tag clefos/etcd --label VERSION=$(VERSION) . 

push:
	docker tag clefos/etcd:latest clefos/etcd:$(VERSION)
	docker push clefos/etcd:latest
	docker push clefos/etcd:$(VERSION)

clean:
	docker rmi clefos/etcd:latest || true
	docker rmi clefos/etcd:$(VERSION) || true
