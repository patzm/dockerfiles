# Visual Studio Code Server

Code from anywhere, right inside your browser!

## Setup
Make sure that the following environment variables are set within the container to match the folder you want to mount:
* `HOME_DIR`: the home folder of the user.
* `PUID`: the user's id, fetch with `id -u`.
* `PGID`: the user's group id, fetch with `id -g`.
* `USER`: the host's `docker` user name, usually `docker`

Additionally, the following optional and _non-sensitive_ environment variables:
* `CODE_SERVER_TAG`: overwrites the Docker :whale: image tag
