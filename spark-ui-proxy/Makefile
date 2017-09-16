VERSION=$(shell cat VERSION)

all:		spark-ui

spark-ui:	Dockerfile
		docker build --rm --tag clefos/spark-ui --label VERSION=$(VERSION) . 

push:
		docker tag clefos/spark-ui:latest clefos/spark-ui:clefos7
		docker tag clefos/spark-ui:latest clefos/spark-ui:$(VERSION)
		docker push clefos/spark-ui:latest
		docker push clefos/spark-ui:clefos7
		docker push clefos/spark-ui:$(VERSION)

clean:
		docker rmi clefos/spark-ui:latest || true
		docker rmi clefos/spark-ui:clefos7 || true
		docker rmi clefos/spark-ui:$(VERSION) || true
