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
This node ID will populate the name field later.
Don't provide the desired final name directly.

Get the address of the Storj API (not the dashboard) such that the dashboard can access it.
That address, e.g. `host:port` can also be on the local network.
It says "publicly accessible address", but it only has to be accessible from the multinode, hence local address works.

Go to the multinode dashboard, click `+ New Node`, and add the previously extracted information.
If the node doesn't show up, use the CLI to see the error message.
