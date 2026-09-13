# Hermes Agent

Hermes dashboard at <https://hermes.patz.app>, with data in `/mnt/ssd-1tb/docker/hermes` and its Vaultwarden bootstrap secret in `/mnt/ssd-1tb/docker-secrets/hermes`.

Set these stack environment variables:

- `HERMES_DASHBOARD_BASIC_AUTH_PASSWORD`
- `HERMES_DASHBOARD_BASIC_AUTH_SECRET` (`openssl rand -hex 32`)

## Vaultwarden bootstrap

Store the dedicated Vaultwarden account's API credentials and master password as dotenv-shaped bootstrap material:

```dotenv
VAULTWARDEN_URL=https://vaultwarden.example.com
BW_CLIENTID=user.account-uuid
BW_CLIENTSECRET=generated-api-key-secret
BW_PASSWORD=your-master-password
```

The API key authenticates the CLI but does not decrypt the vault; `BW_PASSWORD` is required to unlock it. Do not use `BWS_ACCESS_TOKEN`: Vaultwarden does not implement Bitwarden Secrets Manager.

Set the secret's permissions, then start:

```sh
chmod 0644 /mnt/ssd-1tb/docker-secrets/hermes/vaultwarden_private_api_key
cat > /mnt/ssd-1tb/docker/hermes/config.yaml <<'EOF'
dashboard:
  trusted_proxies:
    - "172.16.1.0/24"
EOF
docker compose up -d --build
```

Populate `vaultwarden_private_api_key` before starting the stack. Compose mounts it as a file at `/run/secrets/vaultwarden_private_api_key`; it is not automatically exposed as an environment variable. File-backed Compose secrets retain host ownership and mode, so mode `0644` lets the Hermes process (UID/GID `10000`) read the root-owned file while the `0700` parent directory prevents other host users from traversing it. The CLI's app-data directory is mounted as tmpfs at `/run/hermes-bw`, preventing its encrypted vault cache from persisting under `/opt/data`.

The custom image installs pinned, checksum-verified Bitwarden and Himalaya CLIs system-wide and runs `entrypoint.sh`, which sources `vaultwarden-start.sh` to configure the Vaultwarden server, log in with the API key, and unlock the vault before starting Hermes with `BW_SESSION`. No setup skill or agent prompt is required. Add future system packages to `Dockerfile`. If Hermes needs retrieval guidance, use:

> Use the already authenticated `bw` CLI for credentials. Sync before reading, retrieve only the required item or field, and never print or persist secret values.

Configure the model at <https://hermes.patz.app>. Store runtime API credentials in the dedicated Vaultwarden account instead of Hermes' data directory.

Source: <https://hermes-agent.nousresearch.com/docs/user-guide/docker>
