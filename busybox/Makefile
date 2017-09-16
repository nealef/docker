VERSION=$(shell cat VERSION)

all:		busybox

.PHONY:		busybox

busybox:	
		./build.sh

push:
		docker tag busybox:glibc-test clefos/busybox:clefos7
		docker tag busybox:glibc-test clefos/busybox:$(VERSION)
		docker push busybox:glibc-test
		docker push clefos/busybox:clefos7
		docker push clefos/busybox:$(VERSION)

clean:
		docker rmi busybox:glibc-test || true
		docker rmi clefos/busybox:clefos7 || true
		docker rmi clefos/busybox:$(VERSION) || true
		docker rmi busybox:builder || true
