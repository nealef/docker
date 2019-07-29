#!/bin/sh
docker images | grep websphere | awk '{print $3}' | sort -u | xargs docker rmi 2>/dev/null
