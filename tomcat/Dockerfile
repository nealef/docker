FROM 		clefos/ibmjava

MAINTAINER	"The ClefOS Project" <neale@sinenomine.net>
LABEL 		Vendor="ClefOS" License="GPLv2"

ENV 		CATALINA_HOME=/opt/tomcat PATH=$CATALINA_HOME/bin:$PATH
RUN 		mkdir -p "$CATALINA_HOME"
WORKDIR 	$CATALINA_HOME

# see https://www.apache.org/dist/tomcat/tomcat-8/KEYS
RUN 		yum -y install --setopt=tsflags=nodocs wget tar && \
		yum -y update --setopt=tsflags=nodocs && \
		gpg --keyserver pool.sks-keyservers.net --recv-keys \
			05AB33110949707C93A279E3D3EFE6B686867BA6 \
			07E48665A34DCAFAE522E5E6266191C37C037D42 \
			47309207D818FFD8DCD3F83F1931D684307A10A5 \
			541FBE7D8F78B25E055DDEE13C370389288584E7 \
			61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
			713DA88BE50911535FE716F5208B0AB1D63011C7 \
			79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
			9BA44C2621385CB966EBA586F72C284D731FABEE \
			A27677289986DB50844682F8ACB77FC2E86E29AC \
			A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
			DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
			F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
			F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 && \
		wget http://mirrors.koehn.com/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz && \
		tar -xzf apache-tomcat-8.5.20.tar.gz -C $CATALINA_HOME --strip-components=1 && \
		rm -rf apache-tomcat-8.5.20.tar.gz && \
		yum -y erase wget tar && \
		yum clean all && \
		groupadd tomcat && useradd -s /bin/bash -g tomcat tomcat

COPY 		tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

ENV 		TOMCAT_MAJOR=8 TOMCAT_VERSION=8.5.20

EXPOSE 		8080

CMD 		["/opt/tomcat/bin/catalina.sh", "run"]
