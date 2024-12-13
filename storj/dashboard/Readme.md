# Storj Multi-node Dashbaord

## Add an instance to the dashboard
Run the following *inside* the container:
```bash
./bin/storagenode info --config-dir config --identity-dir identity
```

or outside
```bash
docker compose \
    -f insecure.docker-compose.yml \
    --env-file my/env/file/path.env \
    exec storagenode bin/storagenode info --config-dir config --identity-dir identity
```

Copy the generated ID.
You can copy the node ID as well, or copy it from the web-UI.

Get the address of the Storj API (not the dashboard) such that the dashboard can access it.
That address, e.g. `host:port` can also be on the local network.

Go to the multinode dashboard, click `+ New Node`, and add the previously extracted information.
