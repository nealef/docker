VERSION=$(shell cat VERSION)

all:		akka

akka:		Dockerfile
		docker build --rm --tag clefos/akka --label VERSION=$(VERSION) . 

push:
		docker tag clefos/akka:latest clefos/akka:clefos7
		docker tag clefos/akka:latest clefos/akka:$(VERSION)
		docker push clefos/akka:latest
		docker push clefos/akka:clefos7
		docker push clefos/akka:$(VERSION)

clean:
		docker rmi clefos/akka:latest || true
		docker rmi clefos/akka:clefos7 || true
		docker rmi clefos/akka:$(VERSION) || true
