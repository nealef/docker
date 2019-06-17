all:		8-image 10-image 12-image

8-image:	8/Dockerfile
		cd 8; \
		docker build --rm --tag clefos/node:8 . 

10-image:	10/Dockerfile
		cd 10; \
		docker build --rm --tag clefos/node:10 . 

12-image:	12/Dockerfile
		cd 12; \
		docker build --rm --tag clefos/node:12 . 

push:
		docker push clefos/node:8
		docker push clefos/node:10
		docker push clefos/node:12

clean:
		docker rmi clefos/node:8 || true
		docker rmi clefos/node:10 || true
		docker rmi clefos/node:12 || true
