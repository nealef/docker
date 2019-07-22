VERSION=$(shell cat VERSION)

all:		hadoop

hadoop:		Dockerfile
		wget https://archive.apache.org/dist/hadoop/core/hadoop-2.8.1/hadoop-2.8.1.tar.gz
		docker build --rm --tag clefos/hadoop --label VERSION=$(VERSION) .

push:
		docker tag clefos/hadoop:latest clefos/hadoop:clefos7
		docker tag clefos/hadoop:latest clefos/hadoop:$(VERSION)
		docker push clefos/hadoop:latest
		docker push clefos/hadoop:clefos7
		docker push clefos/hadoop:$(VERSION)

clean:
		docker rmi clefos/hadoop:latest || true
		docker rmi clefos/hadoop:clefos7 || true
		docker rmi clefos/hadoop:$(VERSION) || true
