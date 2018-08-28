VERSION=$(shell cat VERSION)

all:	visualizer

visualizer:	Dockerfile
	docker build --rm --tag clefos/visualizer --label VERSION=$(VERSION) . 

push:
	docker tag clefos/visualizer:latest clefos/visualizer:clefos7
	docker tag clefos/visualizer:latest clefos/visualizer:$(VERSION)
	docker push clefos/visualizer:latest
	docker push clefos/visualizer:clefos7
	docker push clefos/visualizer:$(VERSION)

clean:
	docker rmi clefos/visualizer:latest || true
	docker rmi clefos/visualizer:clefos7 || true
	docker rmi clefos/visualizer:$(VERSION) || true
