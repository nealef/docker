# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This image relies on the zeppelin-build image to get the zeppelin
# binaries built, and the Makefile to put it in this directory.

FROM 	sinenomine/spark:latest

ENV 	ZEPPELIN_VER  0.7.1

RUN 	mkdir -p /opt && \
    	cd /opt && \
    	curl http://www.us.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VER}/zeppelin-${ZEPPELIN_VER}-bin-all.tgz | \
    	    tar -zx && \
    	ln -s zeppelin-${ZEPPELIN_VER}-bin-all zeppelin && \
    	echo Zeppelin ${ZEPPELIN_VER} installed in /opt

RUN	yum install -y --setopt=tsflags=nodocs wget && \
	yum clean all && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
	
ADD 	zeppelin-log4j.properties /opt/zeppelin/conf/log4j.properties
ADD 	zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh
ADD 	docker-zeppelin.sh /opt/zeppelin/bin/docker-zeppelin.sh
ADD 	zeppelin-site.xml /opt/zeppelin/conf/zeppelin-site.xml
ADD	shiro.ini /opt/zeppelin/conf/shiro.ini

VOLUME	/opt/zeppelin/vol

RUN 	mv /opt/zeppelin/conf /opt/zeppelin/conf_tmpl && \
 	mv /opt/zeppelin/notebook /opt/zeppelin/notebook_tmpl && \
    	ln -sf /opt/zeppelin/vol/conf /opt/zeppelin/conf && \
    	ln -sf /opt/zeppelin/vol/logs /opt/zeppelin/logs && \
    	ln -sf /opt/zeppelin/vol/run /opt/zeppelin/run && \
    	ln -sf /opt/zeppelin/vol/notebook /opt/zeppelin/notebook && \
    	ln -sf /opt/zeppelin/vol/local-repo /opt/zeppelin/local-repo

ADD	lucene-*.jar /opt/zeppelin/lib/

RUN	rm -f /opt/zeppelin/lib/lucene-*-5.3.1.jar

WORKDIR	/opt/zeppelin/vol

EXPOSE 	8080

ENTRYPOINT ["/opt/zeppelin/bin/docker-zeppelin.sh"]
