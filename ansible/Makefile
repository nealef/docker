VERSION=$(shell cat VERSION)

all:		ansible

ansible:	Dockerfile
		docker build --rm --tag clefos/ansible --label VERSION=$(VERSION) . 

push:
		docker tag clefos/ansible:latest clefos/ansible:clefos7
		docker tag clefos/ansible:latest clefos/ansible:$(VERSION)
		docker push clefos/ansible:latest
		docker push clefos/ansible:clefos7
		docker push clefos/ansible:$(VERSION)

clean:
		docker push clefos/ansible:latest || true
		docker push clefos/ansible:clefos7 || true
		docker push clefos/ansible:$(VERSION) || true
