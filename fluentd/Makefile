VERSION=$(shell cat VERSION)

all:		fluentd

fluentd:	Dockerfile
		docker build --rm --tag clefos/fluentd --label VERSION=$(VERSION) . 

push:
		docker tag clefos/fluentd:latest clefos/fluentd:clefos7
		docker tag clefos/fluentd:latest clefos/fluentd:$(VERSION)
		docker push clefos/fluentd:latest
		docker push clefos/fluentd:clefos7
		docker push clefos/fluentd:$(VERSION)

clean:
		docker rmi clefos/fluentd:latest || true
		docker rmi clefos/fluentd:clefos7 || true
		docker rmi clefos/fluentd:$(VERSION) || true
