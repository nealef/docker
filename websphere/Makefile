VERSION=$(shell cat VERSION)
TAG=$(shell cat VERSION | awk -F \- '{print $$1}')
THIS=$(PWD)

all:	websphere

websphere: 
	@git clone https://github.com/WASdev/ci.docker.git 
	cd ci.docker && patch -p 1 -i ../websphere-clefos-s390x.patch
	cd ci.docker && make

push:
	cd ci.docker/test && ./pushAll.sh docker.io webProfile8
	@rm -rf ci.docker

clean:
	@./clean.sh || true
	@rm -rf ci.docker
