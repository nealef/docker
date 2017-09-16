VERSION=$(shell cat VERSION)

all:		puppet

puppet:		Dockerfile
		docker build --rm --tag clefos/puppet --label VERSION=$(VERSION) . 

push:
		docker tag clefos/puppet:latest clefos/puppet:clefos7
		docker tag clefos/puppet:latest clefos/puppet:$(VERSION)
		docker push clefos/puppet:latest
		docker push clefos/puppet:clefos7
		docker push clefos/puppet:$(VERSION)

clean:
		docker rmi clefos/puppet:latest || true
		docker rmi clefos/puppet:clefos7 || true
		docker rmi clefos/puppet:$(VERSION) || true
