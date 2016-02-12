## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) derived from (https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/clefos71-base-s390x](https://hub.docker.com/r/brunswickheads/clefos71-base-s390x/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. docker build --name=nginx-1.8-s390x .

### Usage

    docker run -d -p 80:80 nginx-1.8-s390x

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx -v <html-dir>:/var/www/html nginx-1.8-s390x

After few seconds, open `http://<host>` to see the welcome page.
