# zookeeper

## Standalone mode 
-> To run zk in standalone mode (1 zk) 
```shell
docker run -d -p {host_port}:2181 {image_name}
--------------------------------------------------
docker run -d -p 2181:2181  zk
```
## Cluster Mode 
-> To run cluster in single node , you have to use separate ports and host N/W   
-> If you don't use HOST N/W then containers will be on docker default bridge n/w.  
   Containers  won't be able to communicate with other if you use localhost(docker will assign ip's). 
   To use same port in all container run "docker inspect {id} " get IP address
   Stop Zk with "sv stop zookeeper" and edit the config with ip and start "sv start zookeeper"

### Local cluster 
-> When you are running containers in HOST N/W , no need to expose ports 

```shell
docker run --net host -name {container-name} -d  -e CLUSTER_SIZE=3 -e SERVER_ID={zk myid} -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="{myid}:{ip}:{server_port}:{election_port},...." zk
---------------------------------------------------------------------------------------------------------------------------------------
docker run --net host --name zk1 -d  -e CLUSTER_SIZE=3 -e SERVER_ID=1 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="1:localhost:2888:3888,2:localhost:2877:3877,3:localhost:2866:3866" zk
docker run --net host --name zk2 -d  -e CLUSTER_SIZE=3 -e SERVER_ID=2 -e CLIENT_PORT=2182 -e ZOOKEEPER_SERVERS="1:localhost:2888:3888,2:localhost:2877:3877,3:localhost:2866:3866" zk
docker run --net host --name zk3 -d  -e CLUSTER_SIZE=3 -e SERVER_ID=3 -e CLIENT_PORT=2183 -e ZOOKEEPER_SERVERS="1:localhost:2888:3888,2:localhost:2877:3877,3:localhost:2866:3866" zk
```
-> run this command to check mode on each container 
```shell
echo stat | nc localhost 2181
echo stat | nc localhost 2182
echo stat | nc localhost 2183
```

### Cluster deployment in multi nodes env

```shell
docker run -d  -e CLUSTER_SIZE=3 -e SERVER_ID=1 ZOOKEEPER_SERVERS="1:10.0.100:2888:3888,2:10.0.101:2888:3888,3:10.0.102:2888:3888" zk
```

## Kubernetes Deployment 
-> Create Statefull set with 3 or 5 replicas 
-> create headless service for accessing nodes individually (service will do LB but we have to connect to node directly)
-> create service for clients to connect on 2181
-> check zk.yaml in root folder

```shell
echo stat | nc zk-0.zk-svc.default.svc.cluster.local 2181
echo stat | nc zk-1.zk-svc.default.svc.cluster.local 2181
echo stat | nc zk-2.zk-svc.default.svc.cluster.local 2181

```