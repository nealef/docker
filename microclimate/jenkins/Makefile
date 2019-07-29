all:	jenkins 

jenkins: Dockerfile 
	@docker build --rm --tag clefos/jenkins:latest . 

VERSION: jenkins
	@docker run --rm -it clefos/jenkins:latest java -jar jenkins.war --version >VERSION

push:   VERSION
	@docker tag clefos/jenkins:latest clefos/jenkins:$(shell cat VERSION)
	@docker push clefos/jenkins:latest
	@docker push clefos/jenkins:$(shell cat VERSION)

clean:  VERSION
	@docker rmi clefos/jenkins:latest 2>/dev/null || true
	docker rmi clefos/jenkins:$(shell cat VERSION) 2>/dev/null || true
	@rm -f VERSION
