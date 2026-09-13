#!/bin/sh
set -eu

echo "[hermes-entrypoint] Initializing Vaultwarden session"
. /usr/local/bin/vaultwarden-start.sh
echo "[hermes-entrypoint] Vaultwarden session ready"

echo "[hermes-entrypoint] Starting Hermes gateway"
exec hermes gateway run
