# syntax=docker/dockerfile:1

FROM ubuntu:20.04

ARG TZ=Europe/Berlin
ARG ADMIN_PASSWORD

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates wget net-tools gnupg tzdata \
    && wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add - \
    && echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list \
    && apt update && apt -y install openvpn-as \
    && rm -rf /var/lib/apt/lists/*

RUN usermod --password $(echo ${ADMIN_PASSWORD} | openssl passwd -1 -stdin) openvpn

RUN echo "${TZ}" > /etc/timezone \
    dpkg-reconfigure --frontend noninteractive tzdata \
    && echo "Configured timezone to ${TZ}, current date is $(date)"

ARG CONFIG_DIR=/local/openvpn_as/etc

WORKDIR ${CONFIG_DIR}
VOLUME ${CONFIG_DIR}

EXPOSE  443/tcp \
        943/tcp \
        945/tcp \
        1194/udp

ENTRYPOINT ["/usr/local/openvpn_as/scripts/openvpnas"]
CMD ["--nodaemon"]

