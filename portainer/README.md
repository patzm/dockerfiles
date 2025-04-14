# Portainer

## Bootstrap
Start by running
```bash
docker compose up -d
```

If all persisted data files still exist, Portainer will launch as usual and the same login credentials can be used.
If not, the initialization wizard starts.

## How to boot-strap without `docker-compose`
```shell
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) \
    patzm/compose \
    $(pwd) up -d --remove-orphans
```
