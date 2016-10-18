# Docker Salt-Master

A Docker image which allows you to run a containerised Salt-Master server.

Derived from the work at https://github.com/thisissoon/Docker-Salt-Master

## Overview

SaltStack makes software for complex systems management at scale. SaltStack is the company that created and maintains the Salt Open project and develops and sells SaltStack Enterprise software, services and support. Easy enough to get running in minutes, scalable enough to manage tens of thousands of servers, and fast enough to communicate with them in seconds.

Salt is a new approach to infrastructure management built on a dynamic communication bus. Salt can be used for data-driven orchestration, remote execution for any infrastructure, configuration management for any app stack, and much more.

## Running the Container

You can easily run the container like so:
```
docker run --rm -it soon/salt-master
```
## Environment Variables

The following environment variables can be set:

* `LOG_LEVEL`: The level to log at, defaults to `error`

## Volumes

There are several volumes which can be mounted to Docker data container as
described here: https://docs.docker.com/userguide/dockervolumes/. The following
volumes can be mounted:

 * `/etc/salt/pki` - This holds the Salt Minion authentication keys
 * `/var/cache/salt` - Job and Minion data cache
 * `/var/logs/salt` - Salts log directory
 * `/etc/salt/master.d` - Master configuration include directory
 * `/srv/salt` - Holds your states, pillars etc

### Data Container

To create a data container you are going to want the thinnest possible docker
image, simply run this docker command, which will download the simplest possible
docker image:
```
docker run -v /etc/salt/pki -v /var/salt/cache -v /var/logs/salt -v /etc/salt/master.d -v /srv/salt --name=salt-master-data clefos72-base-s390x:latest true
```
This will create a stopped container wwith the name of `salt-master-data` and
will hold our persistant salt master data. Now we just need to run our master
container with the `--volumes-from` command:
```
docker run --rm -it --volumes-from=salt-master-data --name=saltmaster brunswickheads/saltmaster-s390x:latest
```

### Sharing Local Folders

To share folders on your local system so you can have your own master
configuration, states, pillars etc just alter the `salt-master-data`
command:
```
docker run -v /etc/salt/pki -v /var/salt/cache -v /var/logs/salt -v /path/to/local:/etc/salt/master.d -v /path/to/local:/srv/salt --name=salt-master-data brunswickheads/clefos72-base-s390x:latest true
```

Now `/path/to/local` can hold your states and master configuration.

## Ports

The following ports are exposed:

 * `4505`
 * `4506`

These ports allow minions to communicate with the Salt Master.

## Running Salt Commands

Once installed run:
```
$ CONTAINER_ID=$(docker run -d soon/salt-master)
$ docker exec -it $CONTAINER_ID salt '*' test.ping
$ docker exec -it $CONTAINER_ID salt '*' grains.items
```
