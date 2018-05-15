FROM buildpack-deps:stretch-curl

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping snmp procps vim && \
    rm -rf /var/lib/apt/lists/*

ENV TELEGRAF_VERSION 1.7.0
COPY ./telegraf-${TELEGRAF_VERSION} /usr/bin/telegraf

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]