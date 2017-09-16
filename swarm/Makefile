VERSION=$(shell cat VERSION)

all:		swarm

swarm:		Dockerfile
		docker build --rm --tag clefos/swarm --label VERSION=$(VERSION) . 

push:
		docker tag clefos/swarm:latest clefos/swarm:clefos7
		docker tag clefos/swarm:latest clefos/swarm:$(VERSION)
		docker push clefos/swarm:latest
		docker push clefos/swarm:clefos7
		docker push clefos/swarm:$(VERSION)

clean:
		docker rmi clefos/swarm:latest || true
		docker rmi clefos/swarm:clefos7 || true
		docker rmi clefos/swarm:$(VERSION) || true
