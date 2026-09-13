#!/bin/sh
set -eu

session_file=/run/hermes-bw/session

if [ -s "$session_file" ]; then
    BW_SESSION=$(cat "$session_file")
    export BW_SESSION
fi

BW_STATUS=$(bw status 2>/dev/null || true)
if ! printf '%s\n' "$BW_STATUS" | grep -q '"status":[[:space:]]*"unlocked"'; then
    echo "[bw-session] Refreshing Vaultwarden session" >&2
    unset BW_SESSION

    set -a
    . /run/secrets/vaultwarden_private_api_key
    set +a

    BW_STATUS=$(bw status)
    if printf '%s\n' "$BW_STATUS" | grep -q '"status":[[:space:]]*"unauthenticated"'; then
        bw config server "$VAULTWARDEN_URL" >/dev/null
        bw login --apikey --quiet --nointeraction
    fi

    BW_SESSION=$(bw unlock --passwordfile /run/secrets/vaultwarden_master_password --raw --nointeraction)
    export BW_SESSION

    umask 077
    session_tmp="${session_file}.$$"
    printf '%s' "$BW_SESSION" > "$session_tmp"
    mv -f "$session_tmp" "$session_file"
    unset session_tmp VAULTWARDEN_URL BW_CLIENTID BW_CLIENTSECRET
fi
unset BW_STATUS session_file

exec bw "$@"
