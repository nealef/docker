#!/bin/bash
# 
# From: https://github.com/ibmruntimes/ci.docker/tree/master/ibmjava
#
# (C) Copyright IBM Corporation 2016, 2017
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
set -eo pipefail

# Dockerfiles to be generated
version="8"
package="jre sdk sfj"
tools="maven"

# sha256sum for the various versions, packages and arches
# Version 8 sums [DO NO EDIT THIS LINE]
declare -A jre_8_sums=(
	[version]="1.8.0_sr5fp26"
	[s390x]="81acd84a1365a631ceb3d848838e3978d23b99dec362adc112ad3a159739ecf1"
)

declare -A sdk_8_sums=(
	[version]="1.8.0_sr5fp26"
	[s390x]="4271fb374261c44fe8f4e487f519cf648bcb45075487fb0e6b8cd3fd55079cc3"
)

declare -A sfj_8_sums=(
	[version]="1.8.0_sr5fp26"
	[s390x]="6d7e2df30f9e41a741a2eaa8598023f29d10760db039bd617da0fce7a2dab355"
)

# Generate the common license and copyright header
print_legal() {
	cat > $1 <<-EOI
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

	EOI
}

# Print the maintainer
print_maint() {
	cat >> $1 <<-EOI
	MAINTAINER The ClefOS Project <neale@sinenomine.net>
	EOI
}

# Print the supported Ubuntu OS
print_clefos_os() {
	cat >> $1 <<-EOI
	FROM docker.io/clefos/clefos:clefos7

	EOI
}

# Select the ClefOS packages
print_clefos_pkg() {
	cat >> $1 <<'EOI'

RUN yum -y update --setopt=tsflags=nodocs \
    && yum install -y wget tar ca-certificates \
    && yum clean all \
    && rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
EOI
}

# Print the Java version that is being installed here
print_env() {
	spkg=$2
	shasums="$spkg"_"${ver}"_sums
	jverinfo=${shasums}[version]
	eval JVER=\${$jverinfo}

	cat >> $1 <<-EOI

ENV JAVA_VERSION $JVER

EOI
}

# Print the main RUN command that installs Java.
# For Java 9 we use jlink to derive the JRE and the SFJ images.
print_java_install() {
	spkg=$2
	dpkg=$3
	shasums="$spkg"_"${ver}"_sums
	archsum=${shasums}[$arch]
	eval ASUM=\${$archsum}
	cat >> $1 <<-EOI
RUN ESUM="$ASUM" \\
    && BASE_URL="https://public.dhe.ibm.com/ibmdl/export/pub/systems/cloud/runtimes/java/meta/" \\
    && YML_FILE="$spkg/linux/$arch/index.yml" \\
EOI
	cat >> $1 <<'EOI'
    && wget -q -U UA_IBM_JAVA_Docker -O /tmp/index.yml $BASE_URL/$YML_FILE \
    && JAVA_URL=$(cat /tmp/index.yml | sed -n '/'$JAVA_VERSION'/{n;p}' | sed -n 's/\s*uri:\s//p' | tr -d '\r') \
    && wget -q -U UA_IBM_JAVA_Docker -O /tmp/ibm-java.bin $JAVA_URL \
    && echo "$ESUM  /tmp/ibm-java.bin" | sha256sum -c - \
    && echo "INSTALLER_UI=silent" > /tmp/response.properties \
    && echo "USER_INSTALL_DIR=/opt/ibm/java" >> /tmp/response.properties \
    && echo "LICENSE_ACCEPTED=TRUE" >> /tmp/response.properties \
    && mkdir -p /opt/ibm \
    && chmod +x /tmp/ibm-java.bin \
    && /tmp/ibm-java.bin -i silent -f /tmp/response.properties \
    && rm -f /tmp/response.properties \
    && rm -f /tmp/index.yml \
EOI

	JCMD="&& rm -f /tmp/ibm-java.bin"

	cat >> $1 <<EOI
    $JCMD
EOI
}

print_java_env() {
	if [ "$pack" == "sdk" ]; then
		if [ "${ver}" == "8" ]; then
			JHOME="/opt/ibm/java/jre"
			JPATH="/opt/ibm/java/bin"
		fi
	else
		JHOME="/opt/ibm/java/jre"
		JPATH="/opt/ibm/java/jre/bin"
	fi
	TPATH="PATH=$JPATH:\$PATH"

	cat >> $1 <<-EOI

ENV JAVA_HOME=$JHOME \\
    $TPATH

EOI
}

print_clefos_cleanup() {
	cat >> $1 <<-EOI
RUN yum erase -y wget \
    && yum clean all \
    && rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
EOI
}

print_exclude_file() {
	spkg=$2
	dpkg=$3
}

generate_java() {
	spkg=$pack;
	dpkg=$pack;
	print_env ${file} $spkg;
	print_exclude_file ${file} $spkg $dpkg;
	print_java_install ${file} $spkg $dpkg;
	print_java_env ${file};
}

generate_clefos() {
	file=$1
	mkdir -p `dirname ${file}` 2>/dev/null
	echo -n "Writing ${file}..."
	print_legal ${file};
	print_clefos_os ${file};
	print_maint ${file};
	print_clefos_pkg ${file};
	generate_java ${file};
	print_clefos_cleanup ${file};
	echo "done"
}

# Print the ibmjava image version
print_java() {
	cat >> $1 <<-EOI
	FROM clefos/ibmjava:${ver}-sdk

	EOI
}

#
print_maven() {
	cat >> $1 <<'EOI'

ARG MAVEN_VERSION=3.6.0

RUN yum update -y \
    && yum install -y wget tar

RUN mkdir -p /usr/share/maven \
    && BASE_URL="http://apache.osuosl.org/maven/maven-3" \
    && wget -q -O /tmp/maven.tar.gz $BASE_URL/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && tar -xzC /usr/share/maven --strip-components=1 -f /tmp/maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

CMD ["/usr/bin/mvn"]
EOI
}

generate_maven() {
	file=$1
	echo -n "Writing ${file}..."
	print_legal ${file};
	print_java ${file};
	print_maint ${file};
	print_maven ${file};
	print_clefos_cleanup ${file};
	echo "done"
}

arch=s390x

# Iterate through all the Java versions for each of the supported packages,
# architectures and supported Operating Systems.
for ver in ${version}
do
	mkdir -p ${ver}
	for pack in ${package}
	do
		mkdir -p ${ver}/${pack}
		file=${ver}/${pack}/Dockerfile
		generate_clefos ${file}
	done
done

# Iterate through all the build tools.
for ver in ${version}
do
	mkdir -p ${ver}
	for tool in ${tools}
	do
	mkdir -p ${ver}/${tool}
		file=${ver}/${tool}/Dockerfile
		generate_maven ${file}
	done
done
