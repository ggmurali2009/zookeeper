FROM alpine:latest
RUN apk add --no-cache curl \
    wget \
    runit \
    pstree
COPY etc/ /etc
RUN chmod -R 777 /etc

STOPSIGNAL SIGCONT
CMD ["/sbin/runit-init"]