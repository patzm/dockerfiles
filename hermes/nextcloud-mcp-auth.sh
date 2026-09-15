#!/bin/sh
set -eu
umask 077

cache_file=/run/hermes-bw/nextcloud-mcp.env
exec 8>/run/hermes-bw/nextcloud-mcp.lock
flock 8

if [ -s "$cache_file" ]; then
    cat "$cache_file"
    exit 0
fi

NC_ITEM=$(bw-session get item hermes-nextcloud-mcp --nointeraction)
NC_USER=$(printf '%s' "$NC_ITEM" | jq -r '.login.username // empty')
NC_PASS=$(printf '%s' "$NC_ITEM" | jq -r '.login.password // empty')
unset NC_ITEM

if [ -z "$NC_USER" ] || [ -z "$NC_PASS" ]; then
    echo "Nextcloud MCP credential is incomplete" >&2
    exit 1
fi

NEXTCLOUD_MCP_BASIC_AUTH=$(printf '%s:%s' "$NC_USER" "$NC_PASS" | base64 | tr -d '\n')
cache_tmp="${cache_file}.$$"
printf 'NEXTCLOUD_MCP_BASIC_AUTH=%s\n' "$NEXTCLOUD_MCP_BASIC_AUTH" > "$cache_tmp"
mv -f "$cache_tmp" "$cache_file"
cat "$cache_file"

unset NC_USER NC_PASS NEXTCLOUD_MCP_BASIC_AUTH cache_file cache_tmp
