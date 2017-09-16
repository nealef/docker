VERSION=$(shell cat VERSION)

all:		wordpress

wordpress:	Dockerfile
		docker build --rm --tag clefos/wordpress --label VERSION=$(VERSION) . 

push:
		docker tag clefos/wordpress:latest clefos/wordpress:clefos7
		docker tag clefos/wordpress:latest clefos/wordpress:$(VERSION)
		docker push clefos/wordpress:latest
		docker push clefos/wordpress:clefos7
		docker push clefos/wordpress:$(VERSION)

clean:
		docker rmi clefos/wordpress:latest || true
		docker rmi clefos/wordpress:clefos7 || true
		docker rmi clefos/wordpress:$(VERSION) || true
