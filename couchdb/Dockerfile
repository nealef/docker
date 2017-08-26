# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

FROM 		sinenomine/clefos-base-s390x:latest

MAINTAINER 	"The ClefOS Project" <neale@sinenomine.net>

COPY		epel.repo /etc/yum.repos.d/

RUN		yum -y --setopt=tsflags=nodocs update && \
		yum -y --setopt=tsflags=nodocs install ca-certificates \
			couchdb gpg supervisor erlang-erts && \
		yum clean all && \ 
		rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log 

# https://www.apache.org/dist/couchdb/KEYS
ENV 		GPG_KEYS \
		15DD4F3B8AACA54740EB78C7B7B7C53943ECCEE1 \
		1CFBFA43C19B6DF4A0CA3934669C02FFDF3CEBA3 \
		25BBBAC113C1BFD5AA594A4C9F96B92930380381 \
		4BFCA2B99BADC6F9F105BEC9C5E32E2D6B065BFB \
		5D680346FAA3E51B29DBCB681015F68F9DA248BC \
		7BCCEB868313DDA925DF1805ECA5BCB7BB9656B0 \
		C3F4DFAEAD621E1C94523AEEC376457E61D50B88 \
		D2B17F9DA23C0A10991AF2E3D9EE01E47852AEE4 \
		E0AF0A194D55C84E4A19A801CDB0C0F904F4EE9B

RUN 		set -xe \
		&& for key in $GPG_KEYS; do \
			gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
		done

ENV 		COUCHDB_VERSION 1.6.1

COPY 		./docker-entrypoint.sh /

ADD		couchdb.ini /etc/supervisord.d/

RUN 		chmod +x /docker-entrypoint.sh

# Define mountable directories.
VOLUME 		["/var/couchdb"]

EXPOSE 		5984
WORKDIR 	/var/lib/couchdb

ENTRYPOINT 	["/docker-entrypoint.sh"]

CMD 		["supervisord"]
