# docker

**Docker build scripts for ClefOS**

Files to build Docker containers for ClefOS 7.1

There are additional files required that you will need to supply in the following directories:

* `java` - IBM Java SDK from IBM Developerworks (e.g. ibm-java-sdk-8.0-1.10-s390x-archive.bin)

  * Note, `dummy-java-1.8-0.el7.noarch.rpm` is used to register the presence of the Java SDK as the installation of the IBM SDK is not via an RPM. Consequently, packages (such as tomcat) which check for the presence of the JDK when installed would fail. This RPM will register itself as providing: java-1.8.0 and java-devel-1.8.0.

* `mongodb` - IBM mongodb tar ball

* `nodejs` - IBM nodejs tar ball (ibm-1.2.0.6-node-v0.12.7-linux-s390x.bin)

* `mediawiki` - Several:

  * nginx
  * nginx-filesystem
  * php-xcache
  * python-meld3
  * supervisor
