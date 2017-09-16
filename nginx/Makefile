VERSION=$(shell cat VERSION)

all:		nginx

nginx:		Dockerfile
		docker build --rm --tag clefos/nginx --label VERSION=$(VERSION) . 

push:
		docker tag clefos/nginx:latest clefos/nginx:clefos7
		docker tag clefos/nginx:latest clefos/nginx:$(VERSION)
		docker push clefos/nginx:latest
		docker push clefos/nginx:clefos7
		docker push clefos/nginx:$(VERSION)

clean:
		docker rmi clefos/nginx:latest || true
		docker rmi clefos/nginx:clefos7 || true
		docker rmi clefos/nginx:$(VERSION) || true
