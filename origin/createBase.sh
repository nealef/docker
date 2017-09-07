#!/usr/bin/env bash
#
# Create a base CentOS Docker image for OpenShift
#
# This script is useful on systems with yum installed (e.g., building
# a CentOS image on CentOS).  See contrib/mkimage-rinse.sh for a way
# to build CentOS images on other systems.

usage() {
    cat <<EOOPTS
$(basename $0) [OPTIONS] <name>
OPTIONS:
  -y <yumconf>  The path to the yum config to install packages from. The
                default is /etc/yum.conf.
EOOPTS
    exit 1
}

# option defaults
version=""
export PATH=/usr/local/bin:${PATH}
yum_config=/etc/yum.conf
while getopts "y:v:h" opt; do
    case $opt in
        y)
            yum_config=$OPTARG
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            usage
            ;;
    esac
done
shift $((OPTIND - 1))
version="7"
name="centos"

#--------------------

yum clean all
yum makecache fast

export TMPDIR=/var/tmp
target=$(mktemp -d --tmpdir $(basename $0).XXXXXX)

mkdir -m 755 ${target}/dev
mknod -m 600 ${target}/dev/console c 5 1
mknod -m 600 ${target}/dev/initctl p
mknod -m 666 ${target}/dev/full c 1 7
mknod -m 666 ${target}/dev/null c 1 3
mknod -m 666 ${target}/dev/ptmx c 5 2
mknod -m 666 ${target}/dev/random c 1 8
mknod -m 666 ${target}/dev/tty c 5 0
mknod -m 666 ${target}/dev/tty0 c 4 0
mknod -m 666 ${target}/dev/urandom c 1 9
mknod -m 666 ${target}/dev/zero c 1 5

if [ -d /etc/yum/vars ]; then
	mkdir -p -m 755 ${target}/etc/yum
	cp -a /etc/yum/vars ${target}/etc/yum/
fi

yum -c ${yum_config} --installroot=${target} --releasever=/ \
    --setopt=tsflags=nodocs \
    --setopt=group_package_types=mandatory -y install \
    centos-release \
    ncurses-base filesystem nss-softokn-freebl glibc libstdc++ bash pcre zlib libdb bzip2-libs popt libacl libgpg-error lua audit-libs sqlite libcom_err nss-softokn libassuan sed libxml2 keyutils-libs glib2 pinentry cyrus-sasl-lib diffutils libidn gmp gdbm ustr dbus-libs p11-kit-trust libcap-ng libssh2 openssl-libs openssl-ibmca curl cracklib rpm-libs systemd-libs rpm nss-tools coreutils openldap nss-sysinit libutempter python-libs gnupg2 pygpgme rpm-python python-pycurl python-iniparse pyxattr vim-minimal libgcc tzdata setup basesystem glibc-common xz-libs ncurses-libs libsepol libselinux info nspr nss-util libattr libcap readline libffi elfutils-libelf chkconfig \
     libuuid p11-kit libgcrypt grep file-libs pkgconfig shared-mime-info libdb-utils gawk cpio ncurses pth expat libsemanage libtasn1 ca-certificates libverto krb5-libs libcurl gzip cracklib-dicts libmount libpwquality libuser nss pam libblkid shadow-utils util-linux python gpgme rpm-build-libs yum-metadata-parser python-urlgrabber pyliblzma yum yum-plugin-ovl epel-release

cp oss.repo ${target}/etc/yum.repos.d/.

yum -c ${yum_config} --installroot=${target} --releasever=/ \
    --setopt=tsflags=nodocs \
    --setopt=group_package_types=mandatory -y install \
    --enablerepo=oss --nogpgcheck \
    sna-packages 

rm -f ${target}/etc/yum.repos.d/sna.repo

yum -c ${yum_config} --installroot=${target} clean all

rpmkeys --import --root=${target} ${target}/etc/pki/rpm-gpg/RPM-GPG-KEY-SNA

cat > ${target}/etc/sysconfig/network <<EOF
NETWORKING=yes
HOSTNAME=localhost.localdomain
EOF

sed -i'' -e '/distroverpkg/s/$/\ntsflags=nodocs/' ${target}/etc/yum.conf

# tmp
rm -rf ${target}/tmp/*

tar --numeric-owner -c -C ${target} . | docker import - ${name}:${version}
docker run --rm -i -t ${name}:${version} echo success

rm -rf ${target}
