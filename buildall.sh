#!/bin/sh
original_path=$(pwd)
declare -a blacklist=(base/ microclimate/ origin/ akka/ earthquake/ grafana/ react/)

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

for x in $(ls -d */)
do
    if [ $(containsElement $x "${blacklist[@]}" ; echo $?) == 1 ]
    then
        echo $x
        $(cd $x ; make all ; cd $original_path)
    fi
done