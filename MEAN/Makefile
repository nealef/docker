VERSION=$(shell cat VERSION)

all:		mean

mean:		Dockerfile
		docker build --rm --tag clefos/mean --label VERSION=$(VERSION) . 

push:
		docker tag clefos/mean:latest clefos/mean:clefos7
		docker tag clefos/mean:latest clefos/mean:$(VERSION)
		docker push clefos/mean:latest
		docker push clefos/mean:clefos7
		docker push clefos/mean:$(VERSION)

clean:
		docker rmi clefos/mean:latest || true
		docker rmi clefos/mean:clefos7 || true
		docker rmi clefos/mean:$(VERSION) || true
