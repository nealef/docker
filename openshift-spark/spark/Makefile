all: spark zeppelin
push: push-spark push-zeppelin
.PHONY: push push-spark push-zeppelin spark zeppelin zeppelin-build

# To bump the Spark version, bump the spark_ver in Dockerfile, bump
# this tag and reset to v1. You should also double check the native
# Hadoop libs at that point (we grab the 2.6.1 libs, which are
# appropriate for 1.5.2-with-2.6). Note that you'll need to re-test
# Zeppelin (and it may not have caught up to newest Spark).
TAG = 2.1.0

# To bump the Zeppelin version, bump the version in
# zeppelin/Dockerfile and bump this tag and reset to v1.
ZEPPELIN_TAG = 0.7.2

spark:
	docker build --rm -t docker.io/clefos/spark .
	docker tag docker.io/clefos/spark docker.io/clefos/spark:$(TAG)
	docker tag docker.io/clefos/spark:$(TAG) gcr.io/google_containers/spark:$(TAG)

# This target is useful when needing to use an unreleased version of Zeppelin
zeppelin-build:
	docker build --rm -t docker.io/clefos/zeppelin-build zeppelin-build
	docker tag docker.io/clefos/zeppelin-build docker.io/clefos/zeppelin-build:$(TAG)
	docker tag docker.io/clefos/zeppelin-build:$(ZEPPELIN_TAG) gcr.io/google_containers/zeppelin-build:$(ZEPPELIN_TAG)

zeppelin:
	docker build --rm -t docker.io/clefos/zeppelin zeppelin
	docker tag docker.io/clefos/zeppelin docker.io/clefos/zeppelin:$(ZEPPELIN_TAG)
	docker tag docker.io/clefos/zeppelin:$(ZEPPELIN_TAG) gcr.io/google_containers/zeppelin:$(ZEPPELIN_TAG)

push-spark: spark
	docker push docker.io/clefos/spark
	docker push docker.io/clefos/spark:$(TAG)

push-zeppelin: zeppelin
	docker push docker.io/clefos/zeppelin
	docker push docker.io/clefos/zeppelin:$(ZEPPELIN_TAG)

clean:
	docker rmi gcr.io/google_containers/spark:$(TAG) || :
	docker rmi docker.io/clefos/spark:$(TAG) || :
	docker rmi docker.io/clefos/spark || :

	docker rmi gcr.io/google_containers/zeppelin:$(ZEPPELIN_TAG) || :
	docker rmi docker.io/clefos/zeppelin:$(TAG) || :
	docker rmi docker.io/clefos/zeppelin || :

	docker rmi gcr.io/google_containers/zeppelin-build:$(ZEPPELIN_TAG) || :
	docker rmi docker.io/clefos/zeppelin-build:$(TAG) || :
	docker rmi docker.io/clefos/zeppelin-build || :
