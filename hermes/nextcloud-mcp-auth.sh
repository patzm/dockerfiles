#!/bin/sh
set -eu

NC_USER=$(bw-session get username hermes-nextcloud-mcp --nointeraction)
NC_PASS=$(bw-session get password hermes-nextcloud-mcp --nointeraction)

if [ -z "$NC_USER" ] || [ -z "$NC_PASS" ]; then
    echo "Nextcloud MCP credential is incomplete" >&2
    exit 1
fi

NEXTCLOUD_MCP_BASIC_AUTH=$(printf '%s:%s' "$NC_USER" "$NC_PASS" | base64 | tr -d '\n')
printf 'NEXTCLOUD_MCP_BASIC_AUTH=%s\n' "$NEXTCLOUD_MCP_BASIC_AUTH"

unset NC_USER NC_PASS NEXTCLOUD_MCP_BASIC_AUTH
