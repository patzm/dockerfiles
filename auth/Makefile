COMPOSE_TAG=v0.2
COMPOSE_CMD=. /mnt/ssd-1tb/docker/auth/secrets.env && \
	docker run -it --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(CURDIR):$(CURDIR) \
		-e LDAP_ADMIN_PASSWORD="${ADMIN_PASSWORD}" \
		-e DB_PASSWORD="${DB_PASSWORD}" \
		-e POSTGRES_PASSWORD="${DB_PASSWORD}" \
		-e KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD} \
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
