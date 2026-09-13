#!/bin/sh
set -eu

set -a
. /run/secrets/vaultwarden_private_api_key
set +a

BW_STATUS=$(bw status)
if printf '%s\n' "$BW_STATUS" | grep -q '"status":[[:space:]]*"unauthenticated"'; then
    bw config server "$VAULTWARDEN_URL" >/dev/null
    bw login --apikey --quiet --nointeraction
fi
unset BW_STATUS

BW_SESSION=$(bw unlock --passwordfile /run/secrets/vaultwarden_master_password --raw --nointeraction)
export BW_SESSION
unset VAULTWARDEN_URL BW_CLIENTID BW_CLIENTSECRET
