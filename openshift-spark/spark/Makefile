all: spark zeppelin
push: push-spark push-zeppelin
.PHONY: push push-spark push-zeppelin spark zeppelin zeppelin-build

# To bump the Spark version, bump the spark_ver in Dockerfile, bump
# this tag and reset to v1. You should also double check the native
# Hadoop libs at that point (we grab the 2.6.1 libs, which are
# appropriate for 1.5.2-with-2.6). Note that you'll need to re-test
# Zeppelin (and it may not have caught up to newest Spark).
TAG=$(shell cat VERSION)
HADOOP_VERSION=$(shell cat ../../hadoop-openshift/VERSION)
$(shell cd ../.. ; cd hadoop-openshift ; wget https://archive.apache.org/dist/hadoop/core/hadoop-3.1.0/hadoop-3.1.0.tar.gz)
$(shell cd zeppelin ; wget https://repo1.maven.org/maven2/org/apache/lucene/lucene-core/5.3.2/lucene-core-5.3.2.jar)
# To bump the Zeppelin version, bump the version in
# zeppelin/Dockerfile and bump this tag and reset to v1.
ZEPPELIN_TAG=$(shell cat zeppelin/VERSION)

spark:
	@cp -f ../../hadoop-openshift/hadoop-$(HADOOP_VERSION).tar.gz .
	docker build --rm -t docker.io/clefos/spark .
	docker tag docker.io/clefos/spark docker.io/clefos/spark:$(TAG)
	docker tag docker.io/clefos/spark:$(TAG) gcr.io/google_containers/spark:$(TAG)
	@rm -f hadoop-$(HADOOP_VERSION).tar.gz

# This target is useful when needing to use an unreleased version of Zeppelin
zeppelin-build:
	docker build --rm -t docker.io/clefos/zeppelin-build zeppelin-build
	docker tag docker.io/clefos/zeppelin-build docker.io/clefos/zeppelin-build:$(ZEPPELIN_TAG)
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
	docker rmi docker.io/clefos/zeppelin || :
