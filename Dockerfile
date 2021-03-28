FROM alpine:latest
RUN apk add --no-cache curl \
    wget \
    runit \
    pstree \
    findmnt \
    bash \
    openjdk8


ENV ZOOKEEPER_VERSION=3.4.7 \
    ZOOKEEPER_DATA_DIR=/data/zookeeper/data \
    ZOOKEEPER_LOG_DIR=/data/zookeeper/log \
    ZOOKEEPER_CONF=/etc/zookeeper/conf


RUN wget -q https://archive.apache.org/dist/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz && tar -xzf zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt
RUN mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

RUN ls /opt/zookeeper/conf
COPY etc/ /etc
COPY opt/scripts /opt/scripts
RUN chmod -R 777 /etc
RUN chmod -R 777 /opt/scripts

VOLUME ["/data/zookeeper/data","/data/zookeeper/log"]

EXPOSE 2181 2888 3888
STOPSIGNAL SIGCONT
CMD ["/sbin/runit-init"]