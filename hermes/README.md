# Hermes Agent

Hermes dashboard at <https://hermes.patz.app>, with data in `/mnt/ssd-1tb/docker/hermes` and Vaultwarden bootstrap secrets in `/mnt/ssd-1tb/docker-secrets/hermes`.

Set these stack environment variables:

- `HERMES_DASHBOARD_BASIC_AUTH_PASSWORD`
- `HERMES_DASHBOARD_BASIC_AUTH_SECRET` (`openssl rand -hex 32`)

## Vaultwarden bootstrap

Store the dedicated Vaultwarden account's API credentials in `vaultwarden_private_api_key` as dotenv-shaped bootstrap material:

```dotenv
VAULTWARDEN_URL=https://vaultwarden.example.com
BW_CLIENTID=user.account-uuid
BW_CLIENTSECRET=generated-api-key-secret
```

Store the master password as the only line in `vaultwarden_master_password`, without shell quoting or a variable-name prefix. A normal trailing newline is fine. The API key authenticates the CLI but the master password is still required to decrypt the vault. Do not use `BWS_ACCESS_TOKEN`: Vaultwarden does not implement Bitwarden Secrets Manager.

Set the secret's permissions, then start:

```sh
chmod 0644 /mnt/ssd-1tb/docker-secrets/hermes/vaultwarden_private_api_key \
  /mnt/ssd-1tb/docker-secrets/hermes/vaultwarden_master_password
cat > /mnt/ssd-1tb/docker/hermes/config.yaml <<'EOF'
dashboard:
  trusted_proxies:
    - "172.16.1.0/24"
EOF
docker compose up -d --build
```

Populate both secret files before starting the stack. Compose mounts them at `/run/secrets/vaultwarden_private_api_key` and `/run/secrets/vaultwarden_master_password`; they are not automatically exposed as environment variables. File-backed Compose secrets retain host ownership and mode, so mode `0644` lets the Hermes process (UID/GID `10000`) read the root-owned file while the `0700` parent directory prevents other host users from traversing it. The CLI's app-data directory is mounted as tmpfs at `/run/hermes-bw`, preventing its encrypted vault cache from persisting under `/opt/data`.

The custom image installs pinned, checksum-verified Bitwarden and Himalaya CLIs system-wide. `bw-session` logs in and unlocks on demand, caching its short-lived session at `/run/hermes-bw/session`. Add future system packages to `Dockerfile`. If Hermes needs retrieval guidance, use:

> Use `bw-session` for Bitwarden credentials. Sync before reading, retrieve only the required item or field, and never print or persist secret values.

## Nextcloud MCP

Create a Vaultwarden login item named `hermes-nextcloud-mcp` with the Nextcloud username and a dedicated app password. Verify lookup without printing either value:

```sh
bw-session get username hermes-nextcloud-mcp >/dev/null
bw-session get password hermes-nextcloud-mcp >/dev/null
```

Add these blocks to `/mnt/ssd-1tb/docker/hermes/config.yaml`:

```yaml
secrets:
  command:
    enabled: true
    command: "/usr/local/bin/nextcloud-mcp-auth"
    helper_timeout_seconds: 60
    override_existing: true

mcp_servers:
  nextcloud:
    url: "https://mcp-cloud.patz.app/mcp"
    headers:
      Authorization: "Basic ${NEXTCLOUD_MCP_BASIC_AUTH}"
```

At startup, Hermes' command secret source runs `nextcloud-mcp-auth`. The first process retrieves the Vaultwarden item and atomically caches the dotenv output at `/run/hermes-bw/nextcloud-mcp.env`; concurrent processes return that tmpfs cache instead of repeating the slow unlock. Recreate the container after rotating the app password. If lookup fails, Hermes stays up but the Nextcloud MCP has no usable credential.

Configure the model at <https://hermes.patz.app>. Store runtime API credentials in the dedicated Vaultwarden account instead of Hermes' data directory.

Source: <https://hermes-agent.nousresearch.com/docs/user-guide/docker>
