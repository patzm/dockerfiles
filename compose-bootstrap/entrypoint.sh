#!/bin/sh
set -e

printf "Changing to ${1}\n"
cd "${1}"
shift;

echo "Environment variables:"
env
printf "\n"

set -x
docker compose "$@"
set +x
