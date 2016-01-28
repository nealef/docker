#!/bin/bash

for imgname in bacula-db bacula-db-data bacula-sd bacula-dir; do
	tag="${imgname}-s390x"
	echo "Building ${tag}"
	docker build --no-cache -t brunswickheads/${tag}:latest ${imgname}
done

