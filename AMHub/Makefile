VERSION=$(shell cat VERSION)

all:	AMHub

AMHub:	Dockerfile
	docker build --rm --tag clefos/amhub --label VERSION=$(VERSION) . 

push:
	docker tag clefos/amhub:latest clefos/amhub:clefos7
	docker tag clefos/amhub:latest clefos/amhub:$(VERSION)
	docker push clefos/amhub:latest
	docker push clefos/amhub:clefos7
	docker push clefos/amhub:$(VERSION)

clean:
	docker rmi clefos/amhub:latest || true
	docker rmi clefos/amhub:clefos7 || true
	docker rmi clefos/amhub:$(VERSION) || true
