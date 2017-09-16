VERSION=$(shell cat VERSION)

all:		mediawiki

mediawiki:	Dockerfile
		docker build --rm --tag clefos/mediawiki --label VERSION=$(VERSION) . 

push:
		docker tag clefos/mediawiki:latest clefos/mediawiki:clefos7
		docker tag clefos/mediawiki:latest clefos/mediawiki:$(VERSION)
		docker push clefos/mediawiki:latest
		docker push clefos/mediawiki:clefos7
		docker push clefos/mediawiki:$(VERSION)

clean:
		docker rmi clefos/mediawiki:latest || true
		docker rmi clefos/mediawiki:clefos7 || true
		docker rmi clefos/mediawiki:$(VERSION) || true
