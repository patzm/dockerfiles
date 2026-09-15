#!/bin/sh
set -eu

NC_ITEM=$(bw-session get item hermes-nextcloud-mcp --nointeraction)
NC_USER=$(printf '%s' "$NC_ITEM" | jq -r '.login.username // empty')
NC_PASS=$(printf '%s' "$NC_ITEM" | jq -r '.login.password // empty')
unset NC_ITEM

if [ -z "$NC_USER" ] || [ -z "$NC_PASS" ]; then
    echo "Nextcloud MCP credential is incomplete" >&2
    exit 1
fi

NEXTCLOUD_MCP_BASIC_AUTH=$(printf '%s:%s' "$NC_USER" "$NC_PASS" | base64 | tr -d '\n')
printf 'NEXTCLOUD_MCP_BASIC_AUTH=%s\n' "$NEXTCLOUD_MCP_BASIC_AUTH"

unset NC_USER NC_PASS NEXTCLOUD_MCP_BASIC_AUTH
