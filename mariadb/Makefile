VERSION=$(shell cat VERSION)

all:		mariadb

mariadb:	Dockerfile
		docker build --rm --tag clefos/mariadb:latest --label VERSION=$(VERSION) .

push:		
		docker tag clefos/mariadb:latest clefos/mariadb:clefos7
		docker tag clefos/mariadb:latest clefos/mariadb:$(VERSION)
		docker push clefos/mariadb:latest
		docker push clefos/mariadb:clefos7
		docker push clefos/mariadb:$(VERSION)

clean:	
		docker rmi clefos/mariadb:latest || true
		docker rmi clefos/mariadb:clefos7 || true
		docker rmi clefos/mariadb:$(VERSION) || true
