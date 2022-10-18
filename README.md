# Dockerfiles

My collection of dockerfiles.
In most cases though, I use `docker-compose` files.
Every sub-folder contains the recipe for a single service or collection of services.
In docker :whale: land, they are also called *stacks*.

Almost all services are centered around a reverse proxy, in my case [traefik](https://traefik.io/).
Traefik is a really nice reverse proxy, because
* it can take car of automatic service detection in all running docker containers
* it automatically fetches new SSL certificates through Let's Encrypt
* it has a nice dashboard

Another service is [portainer](https://www.portainer.io/).
It connects to the docker :whale: daemon and allows controlling everything that is running through docker.
A great place to debug or configure all others.

## Setup

Most recipes are stand-alone and only require the setup of Traefik.
For this, create the few external resources by running the `init.sh` script.

The recommended order in which to bring up this project is:
1. Run `init.sh` to create the external, across-stack resources.
2. Bring up the authentication stack `auth`.
3. Bring up Traefik with the `traefik` stack.
4. Bring up Portainer with the `portainer` stack.
5. Use Portainer to bring up all the other stacks.
