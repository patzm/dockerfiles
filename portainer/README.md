# Portainer


## How to boot-strap without `docker-compose`
```shell
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) \
    patzm/compose \
    $(pwd) up -d --remove-orphans
```

or simply
```shell
make up    # for creating the stack
make down  # for tearing it down again
```
