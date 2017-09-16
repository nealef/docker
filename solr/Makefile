VERSION=$(shell cat VERSION)

all:		solr

solr:		Dockerfile
		docker build --rm --tag clefos/solr --label VERSION=$(VERSION) . 

push:
		docker tag clefos/solr:latest clefos/solr:clefos7
		docker tag clefos/solr:latest clefos/solr:$(VERSION)
		docker push clefos/solr:latest
		docker push clefos/solr:clefos7
		docker push clefos/solr:$(VERSION)

clean:
		docker rmi clefos/solr:latest || true
		docker rmi clefos/solr:clefos7 || true
		docker rmi clefos/solr:$(VERSION) || true
