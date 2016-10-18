# Kubernetes Containers

Kubernetes is an open source container cluster manager by Google.  It aims to provide a "platform for automating deployment, scaling, and operations of application containers across clusters of hosts.

Using Kubernetes, you can run and manage docker-formatted containers from one system (a Kubernetes master) and deploy them to run on other systems (Kubernetes nodes). Kubernetes itself consists of a set of system services that allow you to launch and manage Docker containers in what are referred to as pods. Those pods can run across multiple nodes and be interconnected by Kubernetes services. Once defined, pods can quickly scale up or down to meet demand. (Source Redhat [Creating a Kubernetes Cluster to Run Docker Formatted Container Images](https://access.redhat.com/documentation/en/red-hat-enterprise-linux-atomic-host/7/getting-started-with-containers/chapter-4-creating-a-kubernetes-cluster-to-run-docker-formatted-container-images)).

## Overview

Kubernetes is an open source system for managing containerized applications across multiple hosts, providing basic mechanisms for deployment, maintenance, and scaling of applications.

Kubernetes is:

- lean: lightweight, simple, accessible
- portable: public, private, hybrid, multi cloud
- extensible: modular, pluggable, hookable, composable
- self-healing: auto-placement, auto-restart, auto-replication
Kubernetes builds upon a decade and a half of experience at Google running production workloads at scale, combined with best-of-breed ideas and practices from the community.

## Using

1. Start the etcd service
```
docker run -d \
   --net=host \
   --name=etcd \
   brunswickheads/kubernetes-s390x etcd --addr=127.0.0.1:4001 --bind-addr=0.0.0.0:4001 --data-dir=/var/etcd/data
```
2. Start kubelet service
```
docker run \
   --volume=/:/rootfs:ro \
   --volume=/sys:/sys:ro \
   --volume=/var/lib/docker/:/var/lib/docker:ro \
   --volume=/var/data/kubelet:/var/data/kubelet/:rw \
   --volume=/var/run:/var/run:rw \
   --net=host \
   --privileged=true \
   -d \
   --name=kubelet \
   brunswickheads/kubernetes-s390x:latest \
   hyperkube kubelet --containerized --root-dir=/var/data/kubelet --hostname-override="127.0.0.1" --address="0.0.0.0" --api-servers=http://localhost:8080 --config=/etc/kubernetes/manifests 
```
3. Start apiserver service
```
docker run \
   --volume=/:/rootfs:ro \
   --volume=/sys:/sys:ro \
   --volume=/var/lib/docker/:/var/lib/docker:ro \
   --volume=/var/data/kubelet:/var/data/kubelet/:rw \
   --volume=/var/run:/var/run:rw \
   --net=host \
   --privileged=true \
   -d \
   --name=apiserver \
   brunswickheads/kubernetes-s390x:latest \
   hyperkube apiserver --portal_net=10.0.0.1/24 --address=0.0.0.0 --insecure-bind-address=0.0.0.0 --etcd_servers=http://127.0.0.1:4001 --cluster_name=kubernetes --v=2	
```
4. Start controller service
```
docker run \
   -d \
   --net=host \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --name=controller \
   brunswickheads/kubernetes-s390x:latest hyperkube controller-manager --master=127.0.0.1:8080 --v=2
```
5. Start scheduler service
```
docker run \
   -d \
   --net=host \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --name=scheduler \
   brunswickheads/kubernetes-s390x:latest hyperkube scheduler --master=127.0.0.1:8080 --v=2	
```
6. Start proxy service
```
docker run \
   -d \
   --net=host \
   --privileged \
   --name=proxy \
   brunswickheads/kubernetes-s390x:latest hyperkube proxy --master=http://127.0.0.1:8080 --v=2
```
7. Create a pause imaging by adding a tag to the kubernetes image:
```
docker tag <k8s_image_name>:latest gcr.io/google_containers/pause:0.8.0
```

8 .To exercise it you may, for example, deploy solr application on Kubernets single node cluster:
* Pull solr image
```
docker pull s390x/solr
```
* Copy the kubectl executable to local file system
```
docker cp kubectl:/opt/kubernetes/bin/kubectl .
```
* Deploy solr on Kubernets single node cluster
```
./kubectl run solr --image=s390x/solr --port=8983
```
* Verify application is deployed (Pod status should be running)
```
./kubectl get pods
```
Once we get the kubectl command, we can perform various operations on the cluster like checking the status of cluster, deploying an application, getting node information etc.

More information about kubectl interface can be found at http://kubernetes.io/v1.0/docs/user-guide/kubectl/kubectl.html
