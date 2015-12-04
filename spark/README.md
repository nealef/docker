#### dockerfiles-centos-spark
========================

ClefOS 7 dockerfile for Apache Spark

Get Docker version

    # docker version

To build:

    # docker build -tag="spark-1.5.2-s390x"

Launch the container using:

    # docker run -d -p 8080:8080 -p 7070:7070 -p 6066:6066 spark-1.5.2-s390x

This will start the spark master process.
