# (C) Copyright IBM Corporation 2016, 2017
#
# ------------------------------------------------------------------------------
#               NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
#                       PLEASE DO NOT EDIT IT DIRECTLY.
# ------------------------------------------------------------------------------
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM docker.io/clefos/clefos:latest

MAINTAINER The ClefOS Project <neale@sinenomine.net>

RUN yum -y update \
    && yum install -y wget tar ca-certificates \
    && yum clean all \
    && rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ENV JAVA_VERSION 11.0.1_13

RUN wget -q -U UA_IBM_JAVA_Docker -O /tmp/ibm-java.tar.gz https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.1%2B13/OpenJDK11U-jdk_s390x_linux_openj9_jdk-11.0.1_13_openj9-0.11.0_11.0.1_13.tar.gz \
    && echo "fb3f4ddaf3e2a9490e34b385e00d76cf6142806d47bd619ef7c193c12acfbb01  /tmp/ibm-java.tar.gz" | sha256sum -c - \
    && mkdir -p /opt/ibm/java \
    && cd /opt/ibm/java \
    && tar -xzf /tmp/ibm-java.tar.gz --strip-components 1 \
    && rm -f /tmp/ibm-java.bin 

RUN yum erase -y wget && yum clean all && rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

ENV JAVA_HOME=/opt/ibm/java 
ENV PATH=$PATH:$JAVA_HOME/bin

