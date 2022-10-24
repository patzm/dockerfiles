# Nextcloud

## Setup

Set the following (sensitive) environment variables:
* `DB_PASSWORD`
* `MYSQL_PASSWORD`
* `MYSQL_ROOT_PASSWORD`

Note that `DB_PASSWORD` and `MYSQL_PASSWORD` must match.

Additionally, the following optional and _non-sensitive_ environment variables:
* `NEXTCLOUD_TAG`: overwrites the Docker :whale: image tag

Then upload the `nextcloud.env` file into Portainer and populate the environment.
