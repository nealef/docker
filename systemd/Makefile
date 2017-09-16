VERSION=$(shell cat VERSION)

all:		systemd

systemd:	Dockerfile
		docker build --rm --tag clefos/systemd --label VERSION=$(VERSION) . 

push:
		docker tag clefos/systemd:latest clefos/systemd:clefos7
		docker tag clefos/systemd:latest clefos/systemd:$(VERSION)
		docker push clefos/systemd:latest
		docker push clefos/systemd:clefos7
		docker push clefos/systemd:$(VERSION)

clean:
		docker rmi clefos/systemd:latest || true
		docker rmi clefos/systemd:clefos7 || true
		docker rmi clefos/systemd:$(VERSION) || true
