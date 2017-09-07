#!/bin/sh
FORCE=0
PUSH=0
BUILD=0
while getopts "BFP" opt
do
	case $opt in 
		B)
			BUILD=1
		;;
		F)
			FORCE=1
		;;
		P)
			PUSH=1
		;;
		*)
			echo "usage: buildBuild [flags]" >&2
			echo "\nwhere flags -" >&2
			echo "-F force rebuild" >&2
		;;
	esac
done
DIR=${HOME}/docker
DOCKER[0]=${DIR}/java
DOCKER[1]=${DIR}/nodejs
DOCKER[2]=${DIR}/MEAN
DOCKER[3]=${DIR}/golang
DOCKER[4]=${DIR}/R-base
DOCKER[5]=${DIR}/R-devel
DOCKER[6]=${DIR}/ansible
DOCKER[7]=${DIR}/bacula/bacula-db-data
DOCKER[8]=${DIR}/postgresql
DOCKER[9]=${DIR}/bacula/bacula-dir
DOCKER[10]=${DIR}/bacula/bacula-fd
DOCKER[11]=${DIR}/bacula/bacula-sd
DOCKER[12]=${DIR}/compose-ui
DOCKER[13]=${DIR}/django
DOCKER[14]=${DIR}/earthquake
DOCKER[15]=${DIR}/erlang
DOCKER[16]=${DIR}/fluentd
DOCKER[17]=${DIR}/ade
DOCKER[18]=${DIR}/hello-nodejs
DOCKER[19]=${DIR}/httpd
DOCKER[20]=${DIR}/kubernetes
DOCKER[21]=${DIR}/lighttpd
DOCKER[22]=${DIR}/mariadb
DOCKER[23]=${DIR}/meanjs
DOCKER[24]=${DIR}/mediawiki
DOCKER[25]=${DIR}/memcached
DOCKER[26]=${DIR}/mongodb
DOCKER[27]=${DIR}/mono
DOCKER[28]=${DIR}/nginx
DOCKER[29]=${DIR}/AMHub
DOCKER[30]=${DIR}/bacula/bacula-db
DOCKER[31]=${DIR}/puppet
DOCKER[32]=${DIR}/qpid
DOCKER[33]=${DIR}/redis
DOCKER[34]=${DIR}/registry
DOCKER[35]=${DIR}/saltmaster
DOCKER[36]=${DIR}/solr
DOCKER[37]=${DIR}/spark
DOCKER[38]=${DIR}/swarm
DOCKER[39]=${DIR}/tomcat
DOCKER[40]=${DIR}/ulboracms
DOCKER[41]=${DIR}/wordpress
DOCKER[42]=${DIR}/openjdk
DOCKER[43]=${DIR}/cobol
for (( i=0; i<${#DOCKER[@]}; i++ ))
do
	IMAGE=`basename ${DOCKER[$i]} | tr [:upper:] [:lower:]`
	cd ${DOCKER[$i]}
	NOW=`stat --format=%Y ${DOCKER[$i]}/Dockerfile`
	CREATED=`docker inspect -f '{{ .Created }}' sinenomine/${IMAGE}-s390x:latest`
	BUILT=`date --date="${CREATED}" +%s`
	X=`docker images | grep sinenomine/${IMAGE}`
	if [ $? -ne 0 -o ${FORCE} -eq 1 -o ${NOW} -gt ${BUILT} ]; then
		if [ ${FORCE} -eq 1 -a ${BUILD} -eq 1 ]; then
			docker rmi sinenomine/${IMAGE}-s390x:latest
		fi
		if [ ${BUILD} -eq 1 ]; then
			echo "Building ${IMAGE}"
			docker build --rm -t sinenomine/${IMAGE}-s390x:latest .
			RC=$?
		else
			RC=0
		fi
		if [ ${RC} -eq 0 -a ${PUSH} -eq 1 ]; then
			docker push sinenomine/${IMAGE}-s390x:latest
			RC=$?
		fi
		echo "---------------------------------------------------- Rc:" $RC
		echo
	fi
done
IMAGE='busybox'
cd ${DIR}/busybox
set -x
NOW=`stat --format=%Y build.sh`
CREATED=`docker inspect -f '{{ .Created }}' busybox:glibc-test`
BUILT=`date --date="${CREATED}" +%s`
X=`docker images | grep sinenomine/${IMAGE}`
if [ $? -ne 0 -o ${FORCE} -eq 1 -o ${NOW} -gt ${BUILT} ]; then
set +x
	if [ ${FORCE} -eq 1 -a ${BUILD} -eq 1 ]; then
		docker rmi sinenomine/${IMAGE}-s390x:latest
	fi
	if [ ${BUILD} -eq 1 ]; then
		echo "Building ${IMAGE}"
		./build.sh 
		RC=$?
	else
		RC=0
	fi
	if [ ${RC} -eq 0 -a ${PUSH} -eq 1 ]; then
		docker push sinenomine/${IMAGE}-s390x:latest
	fi
	echo "---------------------------------------------------- Rc:" $?
	echo
fi
cd ${DIR}
exit	
