VERSION=$(shell cat VERSION)

all:		ulboracms

ulboracms:	Dockerfile
		docker build --rm --tag clefos/ulboracms --label VERSION=$(VERSION) . 

push:
		docker tag clefos/ulboracms:latest clefos/ulboracms:clefos7
		docker tag clefos/ulboracms:latest clefos/ulboracms:$(VERSION)
		docker push clefos/ulboracms:latest
		docker push clefos/ulboracms:clefos7
		docker push clefos/ulboracms:$(VERSION)

clean:
		docker rmi clefos/ulboracms:latest || true
		docker rmi clefos/ulboracms:clefos7 || true
		docker rmi clefos/ulboracms:$(VERSION) || true
