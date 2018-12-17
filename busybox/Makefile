VERSION=$(shell cat VERSION)

all:		busybox

.PHONY:		busybox

busybox:	
		./build.sh

push:
		docker tag busybox:glibc-test docker.io/clefos/busybox:clefos7
		docker tag busybox:glibc-test docker.io/clefos/busybox:glibc-test
		docker tag busybox:glibc-test docker.io/clefos/busybox:$(VERSION)
		docker push docker.io/clefos/busybox:glibc-test
		docker push docker.io/clefos/busybox:clefos7
		docker push docker.io/clefos/busybox:$(VERSION)

clean:
		docker rmi busybox:glibc-test || true
		docker rmi docker.io/busybox:glibc-test || true
		docker rmi docker.io/clefos/busybox:clefos7 || true
		docker rmi docker.io/clefos/busybox:$(VERSION) || true
		docker rmi busybox:glibc-builder || true
