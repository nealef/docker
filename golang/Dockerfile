FROM 		clefos71-base-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>

ENV 		GOLANG_VERSION 1.6

COPY		go1.6*.tar.bz2 /

RUN 		yum install tar -y && \
		ls -l / && \
		tar -xj -C /usr/local --exclude-vcs -f /go1.6*.tar.bz2 && \
		rm /go*.tar.bz2 && \
		yum erase tar -y && \ 
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
ENV 		GOPATH /go
ENV 		PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN 		mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 0777 "$GOPATH"
WORKDIR 	$GOPATH

COPY 		go-wrapper /usr/local/bin/
RUN		chmod +x /usr/local/bin/go-wrapper
