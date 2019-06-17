THIS=$(PWD)
VERSION=11.0.0.Final

all: wildfly


wildfly: base-jdk
	git clone https://github.com/jboss-dockerfiles/wildfly.git ; \
	cd wildfly ; \
	git checkout $(VERSION) -b s390x ; \
	docker build --rm --tag docker.io/clefos/jboss-wildfly:$(VERSION) .

base-jdk: base
	git clone https://github.com/jboss-dockerfiles/base-jdk.git ; \
	cd base-jdk ; \
	patch -p 1 -i $(THIS)/jboss-java-base-s390x.patch ; \
	docker build --rm --tag docker.io/clefos/jboss-java-base:latest . ; \
	docker tag docker.io/clefos/jboss-java-base:latest jboss/base-jdk:8

base: 
	git clone https://github.com/jboss-dockerfiles/base.git ; \
	cd base ; \
	patch -p 1 -i $(THIS)/jboss-base-s390x.patch ; \
	docker build --rm --tag docker.io/clefos/jboss-base:latest . ; \
	docker tag docker.io/clefos/jboss-base:latest jboss/base:latest

push:	wildfly
	@docker push docker.io/clefos/jboss-wildfly:$(VERSION)
	@docker push docker.io/clefos/jboss-java-base:latest

clean:
	@docker rmi docker.io/clefos/jboss-base:latest || :
	@docker rmi jboss/base:latest || :
	@docker rmi docker.io/clefos/jboss-java-base:latest || :
	@docker rmi jboss/base-jdk:8 || :
	@docker rmi docker.io/clefos/jboss-wildfly:$(VERSION) || :
	@rm -rf base base-jdk wildfly
