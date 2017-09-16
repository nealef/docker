all:	sdk jre sfj maven

jre:	8/jre/Dockerfile 9/jre/Dockerfile
	cd 8/jre; docker build --rm --tag clefos/ibmjava:8 .
	cd 9/jre; docker build --rm --tag clefos/ibmjava:9 .

sdk:	8/sdk/Dockerfile 9/sdk/Dockerfile
	cd 8/sdk; docker build --rm --tag clefos/ibmjava:8-sdk .
	cd 9/sdk; docker build --rm --tag clefos/ibmjava:9-sdk .

sfj:	8/sfj/Dockerfile 9/sfj/Dockerfile
	cd 8/sfj; docker build --rm --tag clefos/ibmjava:8-sfj .
	cd 9/sfj; docker build --rm --tag clefos/ibmjava:9-sfj .

maven:	8/maven/Dockerfile 9/maven/Dockerfile
	cd 8/maven; docker build --rm --tag clefos/maven:8 .
	cd 9/maven; docker build --rm --tag clefos/maven:9 .

8/jre/Dockerfile:	update.sh
	@./update.sh

9/jre/Dockerfile:	update.sh
	@./update.sh

8/sdk/Dockerfile:	update.sh
	@./update.sh

9/sdk/Dockerfile:	update.sh
	@./update.sh

8/sfj/Dockerfile:	update.sh
	@./update.sh

9/sfj/Dockerfile:	update.sh
	@./update.sh

8/maven/Dockerfile:	update.sh
	@./update.sh

9/maven/Dockerfile:	update.sh
	@./update.sh

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
	docker tag clefos/ibmjava:9 clefos/ibmjava:9-jre
	docker push clefos/ibmjava:9
	docker push clefos/ibmjava:9-jre
	docker tag clefos/ibmjava:9-sdk clefos/ibmjava:sdk
	docker push clefos/ibmjava:9-sdk
	docker push clefos/ibmjava:sdk
	docker tag clefos/ibmjava:9-sfj clefos/ibmjava:sfj
	docker push clefos/ibmjava:9-sfj
	docker push clefos/ibmjava:sfj
	docker tag clefos/maven:8 clefos/maven:latest
	docker push clefos/maven:8
	docker push clefos/maven:latest
	docker push clefos/maven:9
