# Traefik for ingress routing

## Setup
Make sure that the following environment variables are set:
* `PUID`
* `PGID`

For instance, bring up this stack by invoking
```shell
PUID=$(id -u) PGID=$(id -g) docker-compose up -d
```

## How to boot-strap without `docker-compose`
```shell
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) \
    -e PUID=$(id -u) \
    -e PGID=$(id -g) \
    patzm/compose:v0.2 \
    $(pwd) up -d --remove-orphans
```

or simply
```shell
make up    # for creating the stack
make down  # for tearing it down again
```

## Authenticate any resource with forward authentication

Guides I used:
- https://www.linkedin.com/pulse/homelab-single-sign-on-tls-aymen-furter/
- https://geek-cookbook.funkypenguin.co.nz/ha-docker-swarm/traefik-forward-auth/keycloak/
