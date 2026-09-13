#!/bin/sh
set -eu

. /usr/local/bin/vaultwarden-start.sh

exec hermes gateway run
