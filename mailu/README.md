# Mailu

## Setup

Set the following (sensitive) environment variables:
* `RELAYUSER`
* `RELAYPASSWORD`
* `SECRET_KEY`: a 16 byte random key.
  Generate like this:
  ```shell
  apt-get install pwgen
  pwgen 16 1
  ```
* `API_TOKEN`: a random string of at least 3 characters. Use `pwgen`.

Then upload the `mailu.env` file into Portainer and populate the environment.

## Upgrade
Portainer doesn't support pulling images from https://ghcr.io right now.
They have to be pulled manually first.
Update the `MAILU_VERSION` in the snippet below and run it.

```shell
export MAILU_VERSION=2.0
docker pull ghcr.io/mailu/unbound:${MAILU_VERSION}
docker pull ghcr.io/mailu/traefik-certdumper:${MAILU_VERSION}
docker pull ghcr.io/mailu/nginx:${MAILU_VERSION}
docker pull ghcr.io/mailu/admin:${MAILU_VERSION}
docker pull ghcr.io/mailu/dovecot:${MAILU_VERSION}
docker pull ghcr.io/mailu/postfix:${MAILU_VERSION}
docker pull ghcr.io/mailu/oletools:${MAILU_VERSION}
docker pull ghcr.io/mailu/rspamd:${MAILU_VERSION}
docker pull ghcr.io/mailu/webmail:${MAILU_VERSION}
```
