VERSION=$(shell cat VERSION)

all:		rabbitmq

rabbitmq:	Dockerfile
		docker build --rm --tag clefos/rabbitmq --label VERSION=$(VERSION) . 

push:
		docker tag clefos/rabbitmq:latest clefos/rabbitmq:clefos7
		docker tag clefos/rabbitmq:latest clefos/rabbitmq:$(VERSION)
		docker push clefos/rabbitmq:latest
		docker push clefos/rabbitmq:clefos7
		docker push clefos/rabbitmq:$(VERSION)

clean:
		docker rmi clefos/rabbitmq:latest || true
		docker rmi clefos/rabbitmq:clefos7 || true
		docker rmi clefos/rabbitmq:$(VERSION) || true
