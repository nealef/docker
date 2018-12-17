all:	build

build:
	cd minikube; make
	cd kubectl; make
	cd helm; make
	cd jenkins; make
	cd bats; make
	cd curl; make
	cd jnlp-slave; make

push:	
	cd minikube; make push
	cd kubectl; make push
	cd helm; make push
	cd jenkins; make push
	cd bats; make push
	cd curl; make push
	cd jnlp-slave; make push

clean:	
	cd minikube; make clean
	cd kubectl; make clean
	cd helm; make clean
	cd jenkins; make clean
	cd bats; make clean
	cd curl; make clean
	cd jnlp-slave; make clean
