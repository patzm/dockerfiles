up:
	docker run -it --rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(CURDIR):$(CURDIR) \
		patzm/compose \
		$(CURDIR) up -d --remove-orphans

down:
	docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(CURDIR):$(CURDIR) \
    patzm/compose \
    $(CURDIR) down -v --remove-orphans

.PHONY: up down
