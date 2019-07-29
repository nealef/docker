FROM 	clefos:latest

MAINTAINER "The ClefOS Project" <neale@sinenomine.net>

ENV 	BATS_HELPERS_DIR=/opt/bats-helpers

# Bats
COPY 	modules/node_modules/bats /opt/bats

# ztombol's bats helpers
COPY 	modules/node_modules/bats-support /opt/bats-helpers/bats-support
COPY 	modules/node_modules/bats-file /opt/bats-helpers/bats-file
COPY 	modules/node_modules/bats-assert /opt/bats-helpers/bats-assert


RUN	ln -s /opt/bats/libexec/bats /sbin/bats

WORKDIR /tests

ENTRYPOINT ["/sbin/bats"]

CMD ["-v"]
