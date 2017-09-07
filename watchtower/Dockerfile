FROM 		sinenomine/clefos-base-s390x:latest

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2" Version="1.0.0-0"

ADD		watchtower /usr/bin

VOLUME 		/var/run/docker.sock 

CMD 		["watchtower"]
