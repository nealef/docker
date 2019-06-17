all:	sdk jre sfj maven

jre:	8/jre/Dockerfile
	cd 8/jre; docker build --rm --tag docker.io/clefos/ibmjava:8 .

sdk:	8/sdk/Dockerfile 11/sdk/Dockerfile
	cd 8/sdk; docker build --rm --tag docker.io/clefos/ibmjava:8-sdk .
	cd 11/sdk; docker build --rm --tag docker.io/clefos/ibmjava:11-sdk .

sfj:	8/sfj/Dockerfile
	cd 8/sfj; docker build --rm --tag docker.io/clefos/ibmjava:8-sfj .

maven:	8/maven/Dockerfile 11/maven/Dockerfile
	cd 8/maven; docker build --rm --tag docker.io/clefos/maven:8 .
	cd 11/maven; docker build --rm --tag docker.io/clefos/maven:11 .

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
	docker tag docker.io/clefos/ibmjava:8 docker.io/clefos/ibmjava:8-jre
	docker tag docker.io/clefos/ibmjava:8 docker.io/clefos/ibmjava:jre
	docker push docker.io/clefos/ibmjava:8
	docker push docker.io/clefos/ibmjava:8-jre
	docker push docker.io/clefos/ibmjava:jre
	docker tag docker.io/clefos/ibmjava:8-sdk docker.io/clefos/ibmjava:sdk
	docker tag docker.io/clefos/ibmjava:8-sdk docker.io/clefos/ibmjava:latest
	docker push docker.io/clefos/ibmjava:8-sdk
	docker push docker.io/clefos/ibmjava:sdk
	docker push docker.io/clefos/ibmjava:latest
	docker tag docker.io/clefos/ibmjava:8-sfj docker.io/clefos/ibmjava:sfj
	docker push docker.io/clefos/ibmjava:11-sdk
	docker tag docker.io/clefos/maven:8 docker.io/clefos/maven:latest
	docker push docker.io/clefos/maven:8
	docker push docker.io/clefos/maven:latest
	docker push docker.io/clefos/maven:11

clean:
	docker rmi docker.io/clefos/ibmjava:8-jre
	docker rmi docker.io/clefos/ibmjava:jre
	docker rmi docker.io/clefos/ibmjava:8-sdk
	docker rmi docker.io/clefos/ibmjava:sdk
	docker rmi docker.io/clefos/ibmjava:latest
	docker rmi docker.io/clefos/ibmjava:11-sdk
	docker rmi docker.io/clefos/maven:8
	docker rmi docker.io/clefos/maven:latest
	docker rmi docker.io/clefos/maven:11
