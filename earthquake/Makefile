VERSION=$(shell cat VERSION)

all:		earthquake

earthquake:	Dockerfile
		docker build --rm --tag clefos/earthquake --label VERSION=$(VERSION) . 

push:
		docker tag clefos/earthquake:latest clefos/earthquake:clefos7
		docker tag clefos/earthquake:latest clefos/earthquake:$(VERSION)
		docker push clefos/earthquake:latest
		docker push clefos/earthquake:clefos7
		docker push clefos/earthquake:$(VERSION)

clean:
		docker rmi clefos/earthquake:latest || true
		docker rmi clefos/earthquake:clefos7 || true
		docker rmi clefos/earthquake:$(VERSION) || true
