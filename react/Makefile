VERSION=$(shell cat VERSION)

all:	react

react:	volume/react-api.tar.gz volume/react-client.tar.gz
	docker build --rm --tag clefos/react-api --label VERSION=$(VERSION) -f Dockerfile.api . 
	docker build --rm --tag clefos/react-client --label VERSION=$(VERSION) -f Dockerfile.client . 

volume/react-api.tar.gz volume/react-client.tar.gz: Dockerfile.api Dockerfile.client VERSION
	docker run --rm -it -v $(PWD)/volume:/volume --privileged clefos/nodejs:latest /volume/build-react.sh

push:
	docker tag clefos/react-api:latest clefos/react-api:clefos7
	docker tag clefos/react-api:latest clefos/react-api:$(VERSION)
	docker push clefos/react-api:latest
	docker push clefos/react-api:clefos7
	docker push clefos/react-api:$(VERSION)
	docker tag clefos/react-client:latest clefos/react-client:clefos7
	docker tag clefos/react-client:latest clefos/react-client:$(VERSION)
	docker push clefos/react-client:latest
	docker push clefos/react-client:clefos7
	docker push clefos/react-client:$(VERSION)

clean:
	rm -f volume/*.tar.gz
	docker rmi clefos/react-api:latest || true
	docker rmi clefos/react-api:clefos7 || true
	docker rmi clefos/react-api:$(VERSION) || true
	docker rmi clefos/react-client:latest || true
	docker rmi clefos/react-client:clefos7 || true
	docker rmi clefos/react-client:$(VERSION) || true
