all : env ${HOME}/go/bin/glide build 

${HOME}/go/bin/glide : 
	go get -u github.com/Masterminds/glide # installs glide for vendoring

build:
	PATH=${PATH}:${HOME}/go/bin glide install  # retrieves package dependencies
	GOPATH=/tmp/go go build                    # compiles and packages an executable binary, watchtower
	rm -rf /tmp/go

test:
	go test 

env:
	pwd
	rm -rf /tmp/go; 							\
	mkdir -p /tmp/go/src/github.com/{Sirupsen,robfig,urfave,v2tec,docker,x};\
	mkdir -p /tmp/go/src/golang.org/x;					\
	cd /tmp/go/src/github.com/Sirupsen; 					\
	git clone http://github.com/Sirupsen/logrus; 				\
	cd ../robfig;								\
	git clone http://github.com/robfig/cron;				\
	cd ../urfave;								\
	git clone http://github.com/urfave/cli;					\
	cd ../v2tec;								\
	git clone http://github.com/v2tec/watchtower;				\
	cd ../docker;								\
	git clone http://github.com/docker/docker;				\
	cd docker;								\
	git checkout 1.13.x;							\
	cd /tmp/go/src/golang.org/x;	 					\
	git clone https://go.googlesource.com/net;				\
	git clone https://go.googlesource.com/sys;				\
	git clone https://go.googlesource.com/crypto;				\
	pwd
