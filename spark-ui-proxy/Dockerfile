FROM 	clefos/clefos:clefos7

COPY 	./spark-ui-proxy.py /

RUN	yum upgrade --setopt=tsflags=nodocs -y && \
	yum install --setopt=tsflags=nodocs -y python && \
	yum clean all && \
	rm -rf /var/log/yum.log /tmp/* /var/cache/yum/*

ENV 	SERVER_PORT=8080
ENV 	BIND_ADDR="0.0.0.0"

EXPOSE 	8080

ENTRYPOINT ["python", "/spark-ui-proxy.py"]
