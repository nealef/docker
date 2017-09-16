VERSION=$(shell cat VERSION)

all:		lighttpd

lighttpd:	Dockerfile
		docker build --rm --tag clefos/lighttpd --label VERSION=$(VERSION) . 

push:
		docker tag clefos/lighttpd:latest clefos/lighttpd:clefos7
		docker tag clefos/lighttpd:latest clefos/lighttpd:$(VERSION)
		docker push clefos/lighttpd:latest
		docker push clefos/lighttpd:clefos7
		docker push clefos/lighttpd:$(VERSION)

clean:
		docker rmi clefos/lighttpd:latest || true
		docker rmi clefos/lighttpd:clefos7 || true
		docker rmi clefos/lighttpd:$(VERSION) || true
