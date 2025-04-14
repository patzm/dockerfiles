# Traefik for ingress routing

## Setup
Make sure that the following environment variables are set:
* `PUID`
* `PGID`
* from KeyCloak, set in `.env`:
    * `PROVIDERS_OIDC_CLIENT_SECRET`
    * `SECRET`


For instance, bring up this stack by invoking
```bash
PUID=$(id -u) PGID=$(id -g) docker compose up -d
```

## Authenticate any resource with forward authentication

Guides I used:
- https://www.linkedin.com/pulse/homelab-single-sign-on-tls-aymen-furter/
- https://geek-cookbook.funkypenguin.co.nz/ha-docker-swarm/traefik-forward-auth/keycloak/
