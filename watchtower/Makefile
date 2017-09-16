VERSION=$(shell cat VERSION)

all:		watchtower

watchtower:	Dockerfile
		docker build --rm --tag clefos/watchtower --label VERSION=$(VERSION) . 

push:
		docker tag clefos/watchtower:latest clefos/watchtower:clefos7
		docker tag clefos/watchtower:latest clefos/watchtower:$(VERSION)
		docker push clefos/watchtower:latest
		docker push clefos/watchtower:clefos7
		docker push clefos/watchtower:$(VERSION)

clean:
		docker rmi clefos/watchtower:latest || true
		docker rmi clefos/watchtower:clefos7 || true
		docker rmi clefos/watchtower:$(VERSION) || true
