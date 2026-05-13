# Cal.com

Self-hosted scheduling with Cal.com.

* URL: https://cal.com/
* Docker reference: https://github.com/calcom/cal.diy/blob/main/docker-compose.yml

## Setup

Set these values before first start.

Sensitive values should **not** be committed in `.env`; provide them through your shell environment or `../stack.env`: 

* `APP_DOMAIN`: public hostname, default `cal.patz.app`
* `POSTGRES_USER`: Postgres user name
* `POSTGRES_PASSWORD`: Postgres password
* `POSTGRES_DB`: Postgres database, default `cal`
* `NEXTAUTH_SECRET`: run `openssl rand -base64 32`
* `CALENDSO_ENCRYPTION_KEY`: run `openssl rand -base64 32`

Persistent data is stored in:

* `/mnt/ssd-1tb/docker/cal/postgresql-data`
* `/mnt/ssd-1tb/docker/cal/redis-data`
