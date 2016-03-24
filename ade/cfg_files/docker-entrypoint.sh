#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- supervisord "$@"
fi

if [ "$1" = 'supervisord' ]; then
	DATADIR="/var/local/ade"
	
	if [ ! -f "$DATADIR/mariadb" ]; then
		if [ -z "$MARIADB_ROOT_PASSWORD" -o -z "$MARIADB_ADE_PASSWORD" ]; then
			echo >&2 'error: database is uninitialized: MARIADB_ROOT_PASSWORD or MARIADB_ADE_PASSWORD not set'
			echo >&2 '  Did you forget to add -e MARIADB_ROOT_PASSWORD=... or -e MARIADB_ADE_PASSWORD=... ?'
			exit 1
		fi
		
		echo 'Running ade mariadb configurator ...'
		# These statements _must_ be on individual lines, and _must_ end with
		# semicolons (no line breaks or comments are permitted).
		# TODO proper SQL escaping on ALL the things D:
		
		tempSqlFile='/var/local/ade/ade-init.sql'
		cat > "$tempSqlFile" <<-EOSQL
			CREATE DATABASE IF NOT EXISTS ade ;
			CREATE USER dbuser@'%' IDENTIFIED BY '${MARIADB_ADE_PASSWORD}' ;
			GRANT ALL ON ade.* TO dbuser@'%' ;
			FLUSH PRIVILEGES ;
		EOSQL
		
		mysql -h mariadb --user=root --password=$MARIADB_ROOT_PASSWORD <$tempSqlFile
		touch $DATADIR/mariadb
	fi
fi

exec "$@"
