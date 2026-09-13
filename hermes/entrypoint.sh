#!/bin/sh
set -eu

export PATH="/opt/data/.local/bin:$PATH"

. /usr/local/bin/vaultwarden-start.sh

exec hermes gateway run
