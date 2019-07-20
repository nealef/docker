#!/bin/sh
for x in $(ls -d */)
do
    if [ $x != 'base/' ]
    then
        $(cd $x ; make all ; cd ..)
    fi
done