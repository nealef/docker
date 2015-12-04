#!/bin/sh
#
# We simply kick off the spark master and sleep forever - this is
# because the start-master script invokes the spark-daemon script
# which kicks off a detached process and returns. Docker detects
# this as the container finishing so it takes us down.
#
trap 'exit 0;' SIGINT SIGQUIT SIGABRT SIGKILL SIGTERM
/opt/ibm/spark/sbin/start-master.sh
while [ 1 ] 
do
	sleep 12h
done
