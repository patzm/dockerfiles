# Authentication providers
- OpenLDAP for legacy support
- KeyCloak for SSO and OAUTH2

## Setup
Create the internal network
```shell
docker network create auth_internal
```
can also be done with the `init.sh` script in the root of the repo.

Set the following environment variables in Portainer or store them in a `secrets.env` file:
- `LDAP_ADMIN_PASSWORD`
- `DB_PASSWORD` and `POSTGRES_PASSWORD` (must be the same)
- `KEYCLOAK_PASSWORD`: this is the initial password for the `admin` user. It can be changed later.

