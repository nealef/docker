VERSION=$(shell cat VERSION)

all:	cobol

cobol:	Dockerfile
	docker build --rm --tag clefos/cobol --label VERSION=$(VERSION) . 

push:
	docker tag clefos/cobol:latest clefos/cobol:clefos7
	docker tag clefos/cobol:latest clefos/cobol:$(VERSION)
	docker push clefos/cobol:latest
	docker push clefos/cobol:clefos7
	docker push clefos/cobol:$(VERSION)

clean:
	docker rmi clefos/cobol:latest || true
	docker rmi clefos/cobol:clefos7 || true
	docker rmi clefos/cobol:$(VERSION) || true
