# Visual Studio Code Server

Code from anywhere, right inside your browser!

## Setup
Make sure that the following environment variables are set within the container to match the folder you want to mount:
* `HOME`: the home folder of the user.
* `PUID`: the user's id, fetch with `id -u`.
* `PGID`: the user's group id, fetch with `id -g`.
