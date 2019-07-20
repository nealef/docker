#!/bin/sh
original_path = $(pwd)
$(declare -a blacklist=(base/ microclimate/ origin/ akka/ earthquake/ grafana/ react/))

for x in $(ls -d */)
do
    if [ $x != 'base/' ]
    then
        $(cd $x ; make all ; cd $original_path)
    fi
done