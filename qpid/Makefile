VERSION=$(shell cat VERSION)

all:		qpid

qpid:		Dockerfile
		docker build --rm --tag clefos/qpid --label VERSION=$(VERSION) . 

push:
		docker tag clefos/qpid:latest clefos/qpid:clefos7
		docker tag clefos/qpid:latest clefos/qpid:$(VERSION)
		docker push clefos/qpid:latest
		docker push clefos/qpid:clefos7
		docker push clefos/qpid:$(VERSION)

clean:
		docker rmi clefos/qpid:latest || true
		docker rmi clefos/qpid:clefos7 || true
		docker rmi clefos/qpid:$(VERSION) || true
