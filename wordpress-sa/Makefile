VERSION=$(shell cat VERSION)

all:		wordpress-sa

wordpress-sa:	Dockerfile
		docker build --rm --tag clefos/wordpress-sa --label VERSION=$(VERSION) . 

push:
		docker tag clefos/wordpress-sa:latest clefos/wordpress-sa:clefos7
		docker tag clefos/wordpress-sa:latest clefos/wordpress-sa:$(VERSION)
		docker push clefos/wordpress-sa:latest
		docker push clefos/wordpress-sa:clefos7
		docker push clefos/wordpress-sa:$(VERSION)

clean:
		docker rmi clefos/wordpress-sa:latest || true
		docker rmi clefos/wordpress-sa:clefos7 || true
		docker rmi clefos/wordpress-sa:$(VERSION) || true
