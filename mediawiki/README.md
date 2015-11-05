# MediaWiki

**Building**

* Start the mariadb container with a name and a volume that it can use for storing data. For example:

  `docker run --name=database -v /tmp/mariadb:/var/lib/mysql --name database --rm=true -t -e MYSQL_ROOT_PASSWORD=database mariadb-5.5-s390x`

* Start the mediawiki container specifying a link to the mariadb container as well a volume for its data. For example:

  `docker run -p 80:80 -i -t --rm=true --link database:database -v /tmp/mediawiki:/data mediawiki-1.25.3-s390x`

* Point your browser at the host and proceed through the mediawiki configuration dialog

* Place the resulting LocalSettings.php file somewhere accessible to the docker host. Make sure it is world readable.

**Running**

* Start the mariadb container with the same name and volume. For example:

  `docker run --name=database -v /tmp/mariadb:/var/lib/mysql --name database --rm=true -t -e MYSQL_ROOT_PASSWORD=database mariadb-5.5-s390x`

* Start the mediawiki container specifying the same link to the mariadb container and the same volume. In addition map the LocalSettings.php file to the mediawiki root. For example:

  `docker run -p 80:80 -i -t --rm=true --link database:database -v /tmp/mediawiki:/data -v /tmp/LocalSettings.php:/src/mediawiki/LocalSettings.php mediawiki-1.25.3-s390x`
