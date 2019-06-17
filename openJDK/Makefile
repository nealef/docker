all:		openjdk

openjdk:	jdk8 jdk11 jdk12

jdk8:      	8/Dockerfile 
		cd 8 ; docker build --rm --tag clefos/openjdk:8 .

jdk11:     	11/Dockerfile
		cd 11 ; docker build --rm --tag clefos/openjdk:11 .

jdk12:     	12/Dockerfile
		cd 12 ; docker build --rm --tag clefos/openjdk:12 .

push:
		docker tag clefos/openjdk:8 clefos/openjdk:clefos7
		docker tag clefos/openjdk:8 clefos/openjdk:latest
		docker push clefos/openjdk:latest
		docker push clefos/openjdk:clefos7
		docker push clefos/openjdk:8
		docker push clefos/openjdk:11
		docker push clefos/openjdk:12

clean:
		docker rmi clefos/openjdk:latest || true
		docker rmi clefos/openjdk:clefos7 || true
		docker rmi clefos/openjdk:8 || true
		docker rmi clefos/openjdk:11 || true
		docker rmi clefos/openjdk:12 || true
