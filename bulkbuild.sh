#!/bin/sh
FORCE=0
PUSH=0
BUILD=0
DELETE=0
while getopts "BDFP" opt
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
		D)
			DELETE=1
		;;
		*)
			echo "usage: buildBuild [flags]" >&2
			echo "\nwhere flags -" >&2
			echo "-F force rebuild" >&2
		;;
	esac
done

echo "===================== Starting ===================="

DOCKERS=`find . -maxdepth 1 -type d | grep -Ev "^\.$|^\./\.git"`
DOCKER=(${DOCKERS})
for (( i=0; i<${#DOCKER[@]}; i++ ))
do
	if [ ! -f ${DOCKER[$i]}/Makefile ]; then
		continue
	if [ ${DELETE} -eq 1 ]; then
		cd ${DOCKER[$i]}
		make clean
		cd ${DIR}
	fi
	RC=0
	if [ ${FORCE} -eq 1 -a ${BUILD} -eq 1 ]; then
		cd ${DOCKER[$i]}
		make clean
		cd ${DIR}
	fi
	if [ ${BUILD} -eq 1 ]; then
		cd ${DOCKER[$i]}
		make
		RC=$?
		cd ${DIR}
	fi
	if [ ${RC} -eq 0 -a ${PUSH} -eq 1 ]; then
		cd ${DOCKER[$i]}
		make push
		RC=$?
		cd ${DIR}
	fi
	echo "${IMAGE} ---------------------------------------------------- Rc:" $RC
	echo
done
cd ${DIR}
exit	
