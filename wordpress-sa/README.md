dockerfiles-clefos-wordpress
========================

(note: This originated from [jbfink](https://github.com/jbfink). I ported over to ClefOS 7.)

Tested on Docker 1.8.0

(note: [Eugene Ware](http://github.com/eugeneware) has a Docker wordpress container build on nginx with some other goodies; you can check out his work [here](http://github.com/eugeneware/docker-wordpress-nginx).)

When you run the below commands, simply use sudo. This is a [known issue](https://twitter.com/docker/status/366040073793323008).)

This repo contains a recipe for making a [Docker](http://docker.io) container for Wordpress, using Linux, Apache and MariaDB on CentOS7. 
To build, make sure you have Docker [installed](http://www.docker.io/gettingstarted/), clone this repo somewhere, and then run:

```
# docker build -rm -t <yourname>/wordpress:latest .
```

Run it:

```
# CID=$(docker run -d -p 80 -p 22 <yourname>/wordpress:latest)
```

Check docker logs after running to see MariaDB root password and Wordpress MariaDB password, as so:

```
# echo "$(docker logs $CID | grep password)"
```

(note: you won't need the MariaDB root or the wordpress db password normally)

Then find the external port assigned to your container:

```
# docker port $CID 80 
```

Visit in a webrowser, then fill out the form. No need to mess with wp-config.php, it's been auto-generated with proper values. 


Note that this image now has a user account (appropriately named "user") and passwordless sudo for that user account. The password is generated upon startup; check logs for "ssh user password", docker ps for the port assigned to 22, and something like this to get in: 

```
# ssh -p <port> user@localhost
```


