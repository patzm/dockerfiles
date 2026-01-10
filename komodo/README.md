# Komodo

## Setup
Create `/mnt/ssd-1tb/docker/komodo/secrets.env` and update the passwords:
```shell
KOMODO_DB_PASSWORD=changeme
KOMODO_PASSKEY=changeme
KOMODO_WEBHOOK_SECRET=changeme
KOMODO_JWT_SECRET=changeme
KOMODO_INIT_ADMIN_PASSWORD=changeme
```

## Bootstrap
```bash
docker compose --env-file .env --env-file /mnt/ssd-1tb/docker/komodo/secrets.env up -d
```

Visit https://komodo.arnold.patz.app to access Komodo.

## Reference
https://komo.do/docs/setup/mongo
