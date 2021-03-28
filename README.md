# zookeeper

docker run --net=host --name zk1 -d -p 2181:2181 -e SERVER_ID=0 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2877:3877,2:localhost:2866:3866" zk
docker run --net=host --name zk2 -d -p 2182:2181 -e SERVER_ID=1 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:127.0.0.0:2888:3888,1:127.0.0.1:2877:3877,2:127.0.0.2:2866:3866" zk
docker run --net=host --name zk3 -d -p 2183:2181 -e SERVER_ID=2 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:127.0.0.0:2888:3888,1:127.0.0.1:2877:3877,2:127.0.0.2:2866:3866" zk





docker run  --name zk1 -d -p 2181:2181 -e SERVER_ID=0 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:zk1:2888:3888,1:zk2:2888:3888,2:zk3:2888:3888" zk
docker run  --name zk2 -d -p 2182:2181 -e SERVER_ID=1 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:zk1:2888:3888,1:zk2:2888:3888,2:zk3:2888:3888" zk
docker run  --name zk3 -d -p 2183:2181 -e SERVER_ID=2 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:zk1:2888:3888,1:zk2:2888:3888,2:zk3:2888:3888" zk



docker run  --name zk1 -d -p 2181:2181 -e SERVER_ID=0 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2888:3888,2:localhost:2888:3888" zk
docker run  --name zk2 -d -p 2182:2181 -e SERVER_ID=1 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2888:3888,2:localhost:2888:3888" zk
docker run  --name zk3 -d -p 2183:2181 -e SERVER_ID=2 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2888:3888,2:localhost:2888:3888" zk



docker run  --net host --name zk1 -d -p 2181:2181 -e SERVER_ID=0 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2888:3888,2:localhost:2888:3888" zk
docker run  --net host  --name zk2 -d -p 2182:2181 -e SERVER_ID=1 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2888:3888,2:localhost:2888:3888" zk
docker run  --net host  --name zk3 -d -p 2183:2181 -e SERVER_ID=2 -e CLIENT_PORT=2181 -e ZOOKEEPER_SERVERS="0:localhost:2888:3888,1:localhost:2888:3888,2:localhost:2888:3888" zk