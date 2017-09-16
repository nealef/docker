#!/bin/bash

VRM="2.1.0"
COUCH_URL="https://www.apache.org/dist/couchdb/source/${VRM}/"
COUCH_CONFIG_DIR="/opt/couchdb/etc/"
COUCH_NAME="apache-couchdb-${VRM}"
COUCH_TAR="${COUCH_NAME}.tar.gz"
COUCH_DIR="${COUCH_NAME}"
COUCH_ASC="${COUCH_TAR}.asc"
COUCH_MD5="${COUCH_TAR}.md5"
COUCH_DEP="wget make autoconf autoconf-archive automake libtool perl-Test-Harness erlang libicu-devel js-devel curl-devel gcc-c++"
CLEANUP_PKGS="wget make autoconf autoconf-archive automake libtool perl-Test-Harness libicu-devel js-devel curl-devel gcc-c++"

# Install epel
yum -y install epel-release;

# Install couchdb dependencies
yum -y install ${COUCH_DEP} && yum clean all

# Download and install couchdb
# * Get the package and its gpgkey
wget "${COUCH_URL}${COUCH_TAR}";
wget "${COUCH_URL}${COUCH_ASC}"
wget "${COUCH_URL}${COUCH_MD5}"
# * Verify the key
echo "*******Verifying the gpgkey*******"
gpg --keyserver pgpkeys.mit.edu --recv-key 61D50B88
gpg --verify ${COUCH_ASC}
md5sum --check ${COUCH_MD5}
if [ $? -ne 0 ]; then
	exit $?;
fi
# * Extract and install
tar -xzf ${COUCH_TAR};
cd ${COUCH_DIR};
/bin/sh ./configure --with-erlang=/usr/lib64/erlang/usr/include --prefix=/opt/couchdb;
make release
if [ $? -eq 0 ]; then
	mkdir -p /opt/couchdb
	cp -ar rel/couchdb/* /opt/couchdb
	mkdir -p /opt/couchdb/var/log
	mkdir -p /opt/couchdb/var/lib
	mkdir -p /opt/couchdb/var/run
fi

# Add couchdb user and proper file ownerships and permissions
adduser -r --home /opt/couchdb/var/lib -M --shell /bin/bash --comment "CouchDB Administrator" couchdb;
chown -R couchdb:couchdb /opt/couchdb;
chmod 0770 /opt/couchdb/etc;
chmod 0770 /opt/couhchdb/var/lib;
chmod 0770 /opt/couchdb/var/log;
chmod 0770 /opt/couchdb/var/run;

# Configure couchdb to listen at 0.0.0.0
sed -e 's/^bind_address = .*$/bind_address = 0.0.0.0/' -i "${COUCH_CONFIG_DIR}default.ini"

# Cleanup unnessasary stuff
yum -y remove ${CLEANUP_PKGS} && yum clean all && rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log
cd ..;
rm -rf ${COUCH_NAME}*
