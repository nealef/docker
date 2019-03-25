VERSION=$(shell cat VERSION)

all:	image grafana-latest.tar.gz

grafana: Dockerfile-build
	docker build --build-arg GRAFANATAG=$(VERSION) --tag docker.io/clefos/grafbuilder:$(VERSION) --file Dockerfile-builder .
	touch grafana

grafana-latest.tar.gz: grafana
	docker run --rm -it -v $(PWD):/output:rw,Z docker.io/clefos/grafbuilder:$(VERSION)

image:	Dockerfile
	docker build --rm --tag docker.io/clefos/grafana:$(VERSION) .

push:	image
	docker tag clefos/grafana:$(VERSION) clefos/grafana:latest
	docker push clefos/grafana:latest
	docker push clefos/grafana:$(VERSION)

clean:
	docker rmi clefos/grafana:latest || true
	dmcker rmi clefos/grafana:$(VERSION) || true
	docker rmi grafbuilder:latest || true
	docker rmi grafbuilder:$(VERSION) || true
	rm -f grafana
