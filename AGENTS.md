# Agent Notes

## What this repo is
- This repo is a collection of independent Docker Compose stacks; there is no root `docker-compose.yml`.
- Each top-level service directory is its own stack (`auth/`, `traefik/`, `portainer/`, `nextcloud/`, etc.).
- Only `compose-bootstrap/` and `openvpn/` contain Dockerfiles; most other directories are compose-only.
- Many stacks are designed to be deployed from Portainer rather than managed long-term from this repo's CLI.

## Bootstrap order (do this on a fresh host)
- Run `./init.sh` from repo root first; it creates the shared external networks `traefik` and `auth_internal`.
- Bring stacks up in this order (from their directories): `auth` -> `traefik` -> `portainer` -> everything else.
- `auth` is typically started with an explicit env file: `docker compose --env-file /mnt/ssd-1tb/docker/auth/secrets.env up -d`.
- `traefik` expects numeric UID/GID set when starting: `PUID=$(id -u) PGID=$(id -g) docker compose up -d`.

## Compose workflow
- Run compose commands from the target stack directory, not repo root.
- Use `docker compose config` as the first verification step after edits (fast syntax + env resolution check).
- There are no repo CI workflows or test/lint tasks; compose validation is the practical local check.

## Env and secrets gotchas
- Many stacks load shared env from `../stack.env` plus stack-local files like `.env`/`mailu.env`.
- `stack.env` is typically created/populated by Portainer from stack environment values; do not treat it as a tracked repo file.
- Stack-specific values are usually set in Portainer UI env vars (often sensitive), then consumed as `stack.env` values during deploy.
- Secrets are often expected outside the repo under `/mnt/ssd-1tb/docker/.../secrets.env`.
- For multi-instance deployments of one stack, prefer env-driven customization (for example router hostnames) so instances do not conflict.
- `.gitignore` only ignores `**/secrets*.env` (plus a few specific paths); if you add differently named secret files, update ignore rules.

## Traefik conventions to preserve
- Traefik Docker provider has `exposedByDefault: false`; services must set `traefik.enable=true` to be reachable.
- Public services should join the external `traefik` network; when a service is on multiple networks, set `traefik.docker.network=traefik`.
- Certificate resolver names come from `traefik/traefik.yml` (`patz.app`, `patz.family`, `bergaufboardab.de`, `whynot.holdings`); router labels must reference one of these.
- The `ai/` stack also requires an additional external network named `ai` (not created by `init.sh`).

## Editing conventions
- Follow `.editorconfig`.
- Preserve existing host path conventions (`/mnt/ssd-1tb/docker/...`, `/mnt/hdd-16tb/...`) unless the task explicitly changes storage layout.
