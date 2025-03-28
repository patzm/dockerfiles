# Authentication providers
- OpenLDAP for legacy support
- KeyCloak for SSO and OAUTH2

## Setup
Create the internal network
```bash
docker network create auth_internal
```
can also be done with the `init.sh` script in the root of the repo.

Upload the `keycloak.env` file into Portainer and populate the environment.

Set the following (sensitive) environment variables in Portainer:
- `LDAP_ADMIN_PASSWORD`
- `DB_PASSWORD`
- `KEYCLOAK_ADMIN_PASSWORD`: this is the initial password for the `admin` user. It can be changed later.

The values should be wrapped in quotes (`"` or `'`).

## How to boot-strap without `docker-compose`
To bring up / update the stack, simply run:

```bash
docker compose --env-file /mnt/ssd-1tb/docker/auth/secrets.env up -d
```

And to destroy it, accordingly
```bash
docker compose --env-file /mnt/ssd-1tb/docker/auth/secrets.env down -v --remove-orphans
```


## Debugging
If authentication issues arise, check the logs.
See, if the log contains the following line seemingly without end:
```
User with username 'admin' already added to '/opt/jboss/keycloak/standalone/configuration/keycloak-add-user.json'
```

If yes, then [this scenario](https://stackoverflow.com/a/60067870/3702319) happened.
To solve it, simply comment [this line](https://github.com/patzm/dockerfiles/blob/22f5841eecfc6365f4abc7ca28b531e927f75a34/auth/keycloak.env#L7) like so:
```INI
# KEYCLOAK_USER=admin
```
and restart the container.
Wait for the initialization to complete.
Once it has completed, you can uncomment that line again.
Now start all dependent services again.
