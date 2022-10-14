#!/bin/sh
set -e

echo "Environment variables:"
env

echo "docker-compose $@"
docker-compose "$@"
