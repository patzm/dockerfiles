# Portainer


## How to boot-strap without `docker-compose`
```bash
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):/bootstrap \
    patzm/compose \
    up -d --remove-orphans
```
