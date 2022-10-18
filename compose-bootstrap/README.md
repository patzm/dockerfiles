# Bootstraped 🥾 `docker-compose`
This image allows running `docker-compose` through an isolated Docker 🐳 container.

## Using it
```bash
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
```bash
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd):$(pwd) \
    patzm/compose \
    $(pwd) up -d
```
will launch the `docker-compose.yml` file in the current working directory in a stack called `HELLO_WORLD` and detach afterwards.

## Building it
Run
```bash
docker buildx build \
	--platform linux/amd64,linux/arm64,linux/arm/v7 \
	-t patzm/compose \
	--push .
```
