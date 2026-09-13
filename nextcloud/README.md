# Nextcloud

Useful debugging information available [here](https://cloud.patz.app/ocs/v2.php/apps/serverinfo/api/v1/info) with the `admin` account.

## Setup

Set the following (sensitive) environment variables:
* `DB_PASSWORD`
* `MYSQL_PASSWORD`
* `MYSQL_ROOT_PASSWORD`

Note that `DB_PASSWORD` and `MYSQL_PASSWORD` must match.

Additionally, the following optional and _non-sensitive_ environment variables:
* `NEXTCLOUD_TAG`: overwrites the Nextcloud Docker :whale: image tag
* `NEXTCLOUD_MCP_TAG`: overwrites the Nextcloud MCP Docker :whale: image tag

Then upload the `nextcloud.env` file into Portainer and populate the environment.

## MCP server

Set the non-sensitive `MOUNT_MCP_DATA` environment variable to a persistent host directory. The MCP endpoint is:

```text
https://mcp-cloud.patz.app/mcp
```

The MCP server runs in `multi_user_basic` mode. Configure each MCP client to send HTTP Basic authentication using the Nextcloud username and a dedicated app password created under **Settings → Security → Devices & sessions**. Do not use the account's login password or add Nextcloud credentials to the container environment.

## Configuration

Disallowed characters in file names:
```
'?', '<', '>', ':', '#', '*', '|', '"', '%', '$', '\n', '\r', '\0'
```
