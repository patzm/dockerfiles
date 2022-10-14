# Traefik for ingress routing

## Setup
Make sure that the following environment variables are set:
* `PUID`
* `PGID`

For instance, bring up this stack by invoking
```bash
PUID=$(id -u) PGID=$(id -g) docker-compose up -d
```

## How to boot-strap without `docker-compose`
```bash
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):/bootstrap \
    -e PUID=$(id -u) \
    -e PGID=$(id -g) \
    patzm/compose \
    up -d --remove-orphans
```

## Authenticate any resource with forward authentication

Guides I used:
- https://www.linkedin.com/pulse/homelab-single-sign-on-tls-aymen-furter/
- https://geek-cookbook.funkypenguin.co.nz/ha-docker-swarm/traefik-forward-auth/keycloak/
