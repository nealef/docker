VERSION=$(shell cat VERSION)

all:		bacula-db bacula-db-data bacula-dir bacula-fd bacula-sd

.PHONY:		bacula-db bacula-db-data bacula-dir bacula-fd bacula-sd

bacula-db:	bacula-db/Dockerfile
		cd bacula-db; docker build --rm --tag clefos/bacula-db --label VERSION=$(VERSION) . 

bacula-db-data:	bacula-db-data/Dockerfile
		cd bacula-db-data; docker build --rm --tag clefos/bacula-db-data --label VERSION=$(VERSION) . 

bacula-dir:	bacula-dir/Dockerfile
		cd bacula-db; docker build --rm --tag clefos/bacula-db --label VERSION=$(VERSION) . 

bacula-fd:	bacula-fd/Dockerfile
		cd bacula-fd; docker build --rm --tag clefos/bacula-fd --label VERSION=$(VERSION) . 

bacula-sd:	bacula-sd/Dockerfile
		cd bacula-sd; docker build --rm --tag clefos/bacula-sd --label VERSION=$(VERSION) . 

push:
		for pkg in "bacula-db" "bacula-db-data" "bacula-dir" "bacula-fd" "bacula-sd"; do \
			echo $$pkg; 							\
			docker tag clefos/$$pkg:latest clefos/$$pkg:clefos7;		\
			docker tag clefos/$$pkg:latest clefos/$$pkg:${VERSION};		\
			docker push clefos/$$pkg:latest;				\
			docker push clefos/$$pkg:clefos7;				\
			docker push clefos/$$pkg:${VERSION};				\
		done

clean:
		for pkg in "bacula-db" "bacula-db-data" "bacula-dir" "bacula-fd" "bacula-sd"; do \
			echo $$pkg; 							\
			docker rmi clefos/$$pkg:latest || true;			\
			docker rmi clefos/$$pkg:clefos7 || true;			\
			docker rmi clefos/$$pkg:${VERSION} || true;			\
		done
