# Anomaly Detection Engine

ClefOS 7 dockerfile for ADE (http://openmainframeproject.github.io/ade/)

## Configuration

The ADE build process will create a private key to be used when connecting via SSH to the container. Copy this and add it to your ssh configuration.

## Installation

Clone Dockerfile somewhere and build the container:

    ```$ sudo docker build --tag=ade-s390x:latest```

Take note of ssh private key that you will use when connecting via ssh.

And now run the container:

    ```$ sudo docker run -d -p 8022:22 -v /srv/docker_mounts/lighttpd/configs:/etc/lighttpd -v /srv/docker_mounts/lighttpd/logs:/var/log/lighttpd -v /srv/docker_mounts/lighttpd/htdocs/:/srv/httpd/htdocs --name=lighttpd -t brunswickheads/ade-s390x:latest```

In above example params means:

* -p 8022:22 - forward external 8022 port from host to container port 22
* -v /srv/docker_mounts/lighttpd/logs:/var/log/lighttpd:rw - mounting host
* /srv/.../logs dir in container's /var/log/lighttpd dir with rw rights

After running container it should be working fine and you should be able to ssh
to it using ssh key that you copied form the build process.

## Testing


## Managing configuration:


## Managing logfiles

You can access logfiles within host in /srv/docker_mounts/ade/logs; those logs
are rotated by containers logrotate.
