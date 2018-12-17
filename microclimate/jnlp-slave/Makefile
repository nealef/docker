VERSION=$(shell cat VERSION)

all:	jnlp-slave

jnlp-slave: Dockerfile 
	@docker build --rm --build-arg VERSION=$(VERSION) --tag clefos/jnlp-slave:latest . 

push:
	docker tag clefos/jnlp-slave:latest clefos/jnlp-slave:$(VERSION)
	docker push clefos/jnlp-slave:latest
	docker push clefos/jnlp-slave:$(VERSION)

clean:
	docker rmi clefos/jnlp-slave:latest || true
	docker rmi clefos/jnlp-slave:$(VERSION) || true
