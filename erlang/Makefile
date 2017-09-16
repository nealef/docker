VERSION=$(shell cat VERSION)

all:		erlang

erlang:		Dockerfile
		docker build --rm --tag clefos/erlang --label VERSION=$(VERSION) . 

push:
		docker tag clefos/erlang:latest clefos/erlang:clefos7
		docker tag clefos/erlang:latest clefos/erlang:$(VERSION)
		docker push clefos/erlang:latest
		docker push clefos/erlang:clefos7
		docker push clefos/erlang:$(VERSION)

clean:
		docker rmi clefos/erlang:latest || true
		docker rmi clefos/erlang:clefos7 || true
		docker rmi clefos/erlang:$(VERSION) || true
