# Visual Studio Code Server

Code from anywhere, right inside your browser!

## Setup
Make sure that the following environment variables are set within the container to match the folder you want to mount:
* `HOME`: the home folder of the user.
* `UID`: the user's id, fetch with `id -u`.
* `GID`: the user's group id, fetch with `id -g`.

Additionally, the following optional and _non-sensitive_ environment variables:
* `CODE_SERVER_TAG`: overwrites the Docker :whale: image tag
