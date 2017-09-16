VERSION=$(shell cat VERSION)

all:		spark-sa

spark-sa:	Dockerfile
		docker build --rm --tag clefos/spark-sa --label VERSION=$(VERSION) . 

push:
		docker tag clefos/spark-sa:latest clefos/spark-sa:clefos7
		docker tag clefos/spark-sa:latest clefos/spark-sa:$(VERSION)
		docker push clefos/spark-sa:latest
		docker push clefos/spark-sa:clefos7
		docker push clefos/spark-sa:$(VERSION)

clean:
		docker rmi clefos/spark-sa:latest || true
		docker rmi clefos/spark-sa:clefos7 || true
		docker rmi clefos/spark-sa:$(VERSION) || true
