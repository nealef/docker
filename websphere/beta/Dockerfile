# (C) Copyright IBM Corporation 2014,2016.
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

FROM 		sinenomine/java-s390x

MAINTAINER 	David Currie <david_currie@uk.ibm.com> (@dcurrie)

RUN 		yum install -y --setopt=tsflags=nodocs unzip wget &&
		yum clean all && \
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# Install WebSphere Liberty
ENV LIBERTY_VERSION 2017.2.0_0

RUN 		LIBERTY_URL=$(wget -q -O - https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/index.yml  | grep $LIBERTY_VERSION -A 3 | sed -n 's/\s*webProfile7:\s//p' | tr -d '\r') && \
		echo $LIBERTY_URL && \
		wget -q $LIBERTY_URL -U UA-IBM-WebSphere-Liberty-Docker -O /tmp/wlp-beta.zip && \
		unzip -q /tmp/wlp-beta.zip -d /opt/ibm && \
		rm -f /tmp/wlp-beta.zip 

ENV PATH=/opt/ibm/wlp/bin:$PATH

# Set Path Shortcuts
ENV 		LOG_DIR=/logs \
    		WLP_OUTPUT_DIR=/opt/ibm/wlp/output

RUN 		mkdir /logs && \
		ln -s $WLP_OUTPUT_DIR/defaultServer /output && \
		ln -s /opt/ibm/wlp/usr/servers/defaultServer /config

# Configure WebSphere Liberty
RUN 		/opt/ibm/wlp/bin/server create && \
		rm -rf $WLP_OUTPUT_DIR/.classCache /output/workarea

COPY 		server.xml /opt/ibm/wlp/usr/servers/defaultServer/

EXPOSE 		9080 9443

CMD 		["/opt/ibm/wlp/bin/server", "run", "defaultServer"]
