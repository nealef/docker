#
# This is the integrated OpenShift Origin Docker registry. It is configured to
# publish metadata to OpenShift to provide automatic management of images on push.
#
# The standard name for this image is openshift/origin-docker-registry
#
FROM 	openshift/origin-base

ENV 	REGISTRY_CONFIGURATION_PATH=/config.yml

COPY 	config.yml $REGISTRY_CONFIGURATION_PATH

RUN	touch /var/lib/rpm/* && \
	yum install -y --setopt=tsflags=nodocs docker-distribution && \
	yum -y update && yum clean all && \
	rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

LABEL 	io.k8s.display-name="OpenShift Origin Image Registry" \
      	io.k8s.description="This is a component of OpenShift Origin and exposes a Docker registry that is integrated with the cluster for authentication and management."

# The registry doesn't require a root user.
USER 	1001
EXPOSE 	5000
VOLUME 	/registry

#CMD 	DOCKER_REGISTRY_URL=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT} registry serve ${REGISTRY_CONFIGURATION_PATH}
CMD 	DOCKER_REGISTRY_URL=${DOCKER_REGISTRY_SERVICE_HOST}:${DOCKER_REGISTRY_SERVICE_PORT} registry serve /config.yml
