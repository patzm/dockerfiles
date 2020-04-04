# Nextcloud

## `secrets.env`
Place a file called `secrets.env` in this directory.
It is ignored by `git`, don't add it forcefully.
The file should define the following variables:
```
DB_PASSWORD=<database-password>
MYSQL_PASSWORD=<database-password>
MYSQL_ROOT_PASSWORD=<mysql-root-password>
```
Note that `DB_PASSWORD` and `MYSQL_PASSWORD` must match.

