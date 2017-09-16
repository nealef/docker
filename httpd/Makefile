VERSION=$(shell cat VERSION)

all:		httpd

httpd:		Dockerfile
		docker build --rm --tag clefos/httpd --label VERSION=$(VERSION) . 

push:
		docker tag clefos/httpd:latest clefos/httpd:clefos7
		docker tag clefos/httpd:latest clefos/httpd:$(VERSION)
		docker push clefos/httpd:latest
		docker push clefos/httpd:clefos7
		docker push clefos/httpd:$(VERSION)

clean:
		docker rmi clefos/httpd:latest || true
		docker rmi clefos/httpd:clefos7 || true
		docker rmi clefos/httpd:$(VERSION) || true
