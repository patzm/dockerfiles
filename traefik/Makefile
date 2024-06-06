COMPOSE_TAG=v0.2

up:
	docker run -it --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(CURDIR):$(CURDIR) \
		-e PUID=$$(id -u) \
		-e PGID=$$(id -g) \
		patzm/compose:${COMPOSE_TAG} \
		$(CURDIR) up -d --remove-orphans

down:
	docker run -it --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(CURDIR):$(CURDIR) \
		-e PUID=$$(id -u) \
		-e PGID=$$(id -g) \
		patzm/compose:${COMPOSE_TAG} \
		$(CURDIR) down -v --remove-orphans

.PHONY: up down
