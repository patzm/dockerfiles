# syntax=docker/dockerfile:1

FROM docker/compose

COPY entrypoint.sh /usr/local/bin
WORKDIR /bootstrap

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD []
