#!/bin/sh
set -eu

echo "[hermes-entrypoint] Initializing Vaultwarden session"
bw-session status >/dev/null
echo "[hermes-entrypoint] Vaultwarden session ready"

echo "[hermes-entrypoint] Starting Hermes gateway"
exec hermes gateway run
