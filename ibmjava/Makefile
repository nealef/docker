all:	sdk jre sfj maven

jre:	8/jre/Dockerfile
	cd 8/jre; docker build --rm --tag clefos/ibmjava:8 .

sdk:	8/sdk/Dockerfile 11/sdk/Dockerfile
	cd 8/sdk; docker build --rm --tag clefos/ibmjava:8-sdk .
	cd 11/sdk; docker build --rm --tag clefos/ibmjava:11-sdk .

sfj:	8/sfj/Dockerfile
	cd 8/sfj; docker build --rm --tag clefos/ibmjava:8-sfj .

maven:	8/maven/Dockerfile 11/maven/Dockerfile
	cd 8/maven; docker build --rm --tag clefos/maven:8 .
	cd 11/maven; docker build --rm --tag clefos/maven:11 .

8/jre/Dockerfile:	update.sh
	@./update.sh

8/sdk/Dockerfile:	update.sh
	@./update.sh

8/sfj/Dockerfile:	update.sh
	@./update.sh

8/maven/Dockerfile:	update.sh
	@./update.sh

11/sdk/Dockerfile:	create.sh
	@./create.sh

11/maven/Dockerfile:	create.sh
	@./create.sh

push:	
	docker tag clefos/ibmjava:8 clefos/ibmjava:8-jre
	docker tag clefos/ibmjava:8 clefos/ibmjava:jre
	docker push clefos/ibmjava:8
	docker push clefos/ibmjava:8-jre
	docker push clefos/ibmjava:jre
	docker tag clefos/ibmjava:8-sdk clefos/ibmjava:sdk
	docker tag clefos/ibmjava:8-sdk clefos/ibmjava:latest
	docker push clefos/ibmjava:8-sdk
	docker push clefos/ibmjava:sdk
	docker push clefos/ibmjava:latest
	docker tag clefos/ibmjava:8-sfj clefos/ibmjava:sfj
	docker push clefos/ibmjava:11-sdk
	docker tag clefos/maven:8 clefos/maven:latest
	docker push clefos/maven:8
	docker push clefos/maven:latest
	docker push clefos/maven:11
