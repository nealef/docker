VRM=$(shell cat VERSION)
THIS=$(PWD)

all:	bats

bats:	Dockerfile
	git clone https://github.com/dduportal-dockerfiles/bats.git ; \
	cd bats ; \
	git checkout tags/$(VRMP) -b $(RELEASE) ; \
	patch -p 1 -i $(THIS)/bats-${VRMP}.patch ; 
	@mkdir -p modules 
	@cp bats_build.sh bats/package*.json modules/.
	@docker run --rm -it -v $(PWD)/modules:/bats:Z docker.io/clefos/nodejs:latest /bats/bats_build.sh
	@docker build --rm --tag clefos/bats:$(VRM). 

push:
	docker tag clefos/bats:$(VRM) clefos/bats:latest
	@docker push clefos/bats:latest
	@docker push clefos/bats:$(VRM)
	#rm -rf bats

clean:
	@docker rmi clefos/bats:latest || true
	@docker rmi clefos/bats:$(VRM) || true
	@rm -rf bats

test:
	cd bats ; \
	make test
