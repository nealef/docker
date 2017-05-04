# https://github.com/francescou/docker-compose-ui
# DOCKER-VERSION 1.9.1
# Adapted from the Dockerfile by Francesco Uliana <francesco@uliana.it> 
# https://github.com/francescou/docker-compose-ui
FROM 		sinenomine/swarm-s390x:latest
MAINTAINER 	"The ClefOS Project" <neale@sinenomine.net>

RUN             yum install python34 python-virtualenv gcc -y

WORKDIR         /app

RUN             virtualenv /env

ADD             requirements.txt /app/requirements.txt

RUN             /env/bin/pip install -r requirements.txt && \
                /env/bin/pip install functools32 && \
                yum erase gcc -y && \
                yum clean all && \
                rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ADD             . /app

VOLUME 		["/opt/docker-compose-projects"]

COPY 		demo-projects /opt/docker-compose-projects

EXPOSE 		5000

CMD             []
ENTRYPOINT      ["/env/bin/python", "/app/main.py"]
