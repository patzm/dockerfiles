# Authentication providers
- OpenLDAP for legacy support
- KeyCloak for SSO and OAUTH2

## Setup
Create the internal network
```shell
docker network create auth_internal
```

Set the following environment variables in Portainer:
- `LDAP_ADMIN_PASSWORD`
- `DB_PASSWORD` and `POSTGRES_PASSWORD` (must be the same)
- `KEYCLOAK_PASSWORD`

