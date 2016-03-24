#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
	set -- r "$@"
fi

export JAVA_HOME=/opt/ibm/java
export PATH=$JAVA_HOME/bin:$PATH

exec "$@"
