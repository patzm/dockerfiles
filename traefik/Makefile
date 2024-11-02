COMPOSE_TAG=v0.2
COMPOSE_CMD=docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v $(CURDIR):$(CURDIR) \
	-e PUID=$$(id -u) \
	-e PGID=$$(id -g) \
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
