VERSION=$(shell cat VERSION)

all:		meanjs

meanjs:		Dockerfile
		docker build --rm --tag clefos/meanjs --label VERSION=$(VERSION) . 

push:
		docker tag clefos/meanjs:latest clefos/meanjs:clefos7
		docker tag clefos/meanjs:latest clefos/meanjs:$(VERSION)
		docker push clefos/meanjs:latest
		docker push clefos/meanjs:clefos7
		docker push clefos/meanjs:$(VERSION)

clean:
		docker rmi clefos/meanjs:latest || true
		docker rmi clefos/meanjs:clefos7 || true
		docker rmi clefos/meanjs:$(VERSION) || true
