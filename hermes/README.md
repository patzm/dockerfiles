# Hermes Agent

Hermes dashboard at <https://hermes.patz.app>, with data in `/mnt/ssd-1tb/docker/hermes`.

Set these stack environment variables:

- `HERMES_DASHBOARD_BASIC_AUTH_PASSWORD`
- `HERMES_DASHBOARD_BASIC_AUTH_SECRET` (`openssl rand -hex 32`)

Initialize and start:

```sh
mkdir -p /mnt/ssd-1tb/docker/hermes
cat > /mnt/ssd-1tb/docker/hermes/config.yaml <<'EOF'
dashboard:
  trusted_proxies:
    - "172.16.1.0/24"
EOF
docker compose up -d
```

Configure the model and API keys at <https://hermes.patz.app>.

Source: <https://hermes-agent.nousresearch.com/docs/user-guide/docker>
