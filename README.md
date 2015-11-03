# docker
Docker build scripts etc

Files to build Docker containers for ClefOS 7.1

There are additional files required that you will need to supply:

1. java - IBM Java SDK from IBM Developerworks (e.g. ibm-java-sdk-8.0-1.10-s390x-archive.bin)

2. mongodb - IBM mongodb tar ball

3. nodejs - IBM nodejs tar ball (ibm-1.2.0.6-node-v0.12.7-linux-s390x.bin)

Note, dummy-java-1.8-0.el7.noarch.rpm is used to register the presence of the Java SDK as the installation of the IBM SDK is not via an RPM. Consequently, packages (such as tomcat) which check for the presence of the JDK when installed would fail. This RPM will register itself as providing: java-1.8.0 and java-devel-1.8.0.
