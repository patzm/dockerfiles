SHELL := /bin/bash

COMPOSE_TAG=v0.2
COMPOSE_CMD=docker run -it --rm \
	--env-file /mnt/ssd-1tb/docker/auth/secrets.env \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(CURDIR):$(CURDIR) \
	patzm/compose:${COMPOSE_TAG} \
	$(CURDIR)

compose:
	$(COMPOSE_CMD) $(ACTION)

up:
	$(MAKE) compose ACTION="up -d --remove-orphans"

down:
	$(MAKE) compose ACTION="down -v --remove-orphans"

logs:
	$(MAKE) compose ACTION="logs -f"

.PHONY: up down logs compose
