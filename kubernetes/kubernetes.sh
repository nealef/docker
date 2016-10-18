#!/bin/sh

echo "Start etcd service"
docker run -d \
   --net=host \
   --name=etcd \
   brunswickheads/kubernetes-s390x etcd --addr=127.0.0.1:4001 --bind-addr=0.0.0.0:4001 --data-dir=/var/etcd/data

echo "Start kubelet service"
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

echo "Start apiserver service"
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

echo "Start controller service"
docker run \
   -d \
   --net=host \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --name=controller \
   brunswickheads/kubernetes-s390x:latest hyperkube controller-manager --master=127.0.0.1:8080 --v=2

echo "Start scheduler service"
docker run \
   -d \
   --net=host \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --name=scheduler \
   brunswickheads/kubernetes-s390x:latest hyperkube scheduler --master=127.0.0.1:8080 --v=2	

echo "Start proxy service"
docker run \
   -d \
   --net=host \
   --privileged \
   --name=proxy \
   brunswickheads/kubernetes-s390x:latest hyperkube proxy --master=http://127.0.0.1:8080 --v=2
