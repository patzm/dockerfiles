COMPOSE_TAG=v0.2
COMPOSE_CMD=docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(CURDIR):$(CURDIR) \
	-e PUID=$$(id -u) \
	-e PGID=$$(id -g) \
	patzm/compose:${COMPOSE_TAG} \
	$(CURDIR)

up:
	$(MAKE) compose ACTION="up -d --remove-orphans"

down:
	$(MAKE) compose ACTION="down -v --remove-orphans"

logs:
	$(MAKE) compose ACTION="logs -f"

compose:
	$(COMPOSE_CMD) $(ACTION)

.PHONY: up down logs compose
