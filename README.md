# Dockerfiles

My collection of dockerfiles.
In most cases though, I use `docker-compose` files.
Every sub-folder contains one service.

Almost all services are centered around a reverse proxy, in my case [traefik](https://traefik.io/).
Traefik is a really nice reverse proxy, because
* it can take car of automatic service detection in all running docker containers
* it automatically fetches new SSL certificates through Let's Encrypt
* it has a nice dashboard

Another service is [portainer](https://www.portainer.io/).
It connects to the docker :whale: daemon and allows controlling everything that is running through docker.
A great place to debug or configure all others.
