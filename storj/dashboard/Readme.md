# Storj Multi-node Dashbaord

## Add an instance to the dashboard
Run the following *inside* the container:
```bash
./bin/storagenode issue-apikey --config-dir config --identity-dir identity
```

Copy the generated ID after the log messages.
You can copy the node ID as well (from the logs), or copy it from the web-UI.

Get the address of the Storj API (not the dashboard) such that the dashboard can access it.
That address, e.g. `host:port` can also be on the local network.

Go to the multinode dashboard, click `+ New Node`, and add the previously extracted information.
