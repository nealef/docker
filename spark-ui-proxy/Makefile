VERSION=$(shell cat VERSION)

all:		spark-ui-proxy

spark-ui-proxy:	Dockerfile
		docker build --rm --tag clefos/spark-ui-proxy --label VERSION=$(VERSION) . 

push:
		docker tag clefos/spark-ui-proxy:latest clefos/spark-ui-proxy:clefos7
		docker tag clefos/spark-ui-proxy:latest clefos/spark-ui-proxy:$(VERSION)
		docker push clefos/spark-ui-proxy:latest
		docker push clefos/spark-ui-proxy:clefos7
		docker push clefos/spark-ui-proxy:$(VERSION)

clean:
		docker rmi clefos/spark-ui-proxy:latest || true
		docker rmi clefos/spark-ui-proxy:clefos7 || true
		docker rmi clefos/spark-ui-proxy:$(VERSION) || true
