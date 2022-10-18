#!/bin/sh
set -e

printf "Changing to ${1}\n"
cd "${1}"
shift;

printf "Environment variables:\n$(env)\n"

set -x
docker-compose "$@"
set +x
