# Nextcloud

## Setup

Set the following (sensitive) environment variables:
* `DB_PASSWORD`
* `MYSQL_PASSWORD`
* `MYSQL_ROOT_PASSWORD`

Note that `DB_PASSWORD` and `MYSQL_PASSWORD` must match.

Additionally, set / override the following variables:
* `NEXTCLOUD_TAG`: the Docker :whale: image tag

Then upload the `nextcloud.env` file into Portainer and populate the environment.
