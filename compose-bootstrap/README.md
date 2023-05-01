# Bootstraped 🥾 `docker-compose`
This image allows running `docker-compose` through an isolated Docker 🐳 container.

## Using it
```shell
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) \
    -e SOME_VAR=SOME_VALUE\
    patzm/compose \
    $(pwd) <COMPOSE_ARGUMENTS>
```
Pass any environment variables that you want to be set using the `-e` flag.
The first argument is used as the stack name.
All subsequent arguments are passed to `docker-compose` as one would expect it.
For instance:
```shell
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) \
    patzm/compose \
    $(pwd) up -d
```
will launch the `docker-compose.yml` file in the current working directory in a stack called `HELLO_WORLD` and detach afterwards.

## Building it
First make sure an appropriate builder exists
```shell
docker buildx create --platform linux/arm64,linux/arm/v8 --name bob_der_baumeister
```

Run
```shell
docker buildx build \
    --builder bob_der_baumeister \
    -t patzm/compose:latest \
    -t patzm/compose:v0.X \
    --push .
```
