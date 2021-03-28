#!/bin/bash

echo "In create_config.sh file "
echo "This file will contains scripts to create zoo.cfg file "

mkdir -p /etc/zookeeper/conf


clientPort=${CLIENT_PORT:-2181}
echo "clientPort=${clientPort}" > /etc/zookeeper/conf/zoo.cfg

serverPort=${SERVER_PORT:-2181}
echo "serverPort=${serverPort}"

electionPort=${ELECTION_PORT:-2181}
echo "electionPort=${electionPort}"

dataDir=${DATA_DIR:-/mnt/zookeeper/data}
echo "dataDir=${dataDir}" >> /etc/zookeeper/conf/zoo.cfg

dataLogDir=${DATA_LOG_DIR:-/mnt/zookeeper/log}
echo "dataLogDir=${dataLogDir}" >> /etc/zookeeper/conf/zoo.cfg

tickTime=${TICK_TIME:-2000}
echo "tickTime=${tickTime}" >> /etc/zookeeper/conf/zoo.cfg

initLimit=${INIT_LIMIT:-10}
echo "initLimit=${initLimit}" >> /etc/zookeeper/conf/zoo.cfg

syncLimit=${SYNC_LIMIT:-10}
echo "syncLimit=${syncLimit}" >> /etc/zookeeper/conf/zoo.cfg


# first get server id which is myid for this zk
myid=${SERVER_ID}

echo ${SERVER_ID} > ${dataDir}/myid
# Format for specifying zk's in current ensmble 1:ip:port:port 10:3888:2888,11:3888:2888


zookeeper_servers=${ZOOKEEPER_SERVERS}
echo "received zk servers = ${zookeeper_servers}"




IFS="," read -a servers <<< ${zookeeper_servers}

echo "My array: ${servers[@]}"
echo "Number of elements in the array: ${#servers[@]}"

for server in "${servers[@]}"
do
    echo "$server"
    IFS=":" read -a data <<< $server
    echo "server.${data[0]}=${data[1]}:${data[2]}:${data[3]}" >> /etc/zookeeper/conf/zoo.cfg
done

echo "CREATED ALL CONFIGS "

cat /etc/zookeeper/conf/zoo.cfg