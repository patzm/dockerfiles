# Dynamic DNS
Updates a Dynamic DNS server with the IP of this node.

If the dynamic DNS is running behind a FritzBox, adjust the `cmd` according to [this](https://github.com/linuxserver/docker-ddclient#get-dynamic-ip-from-fritzbox).

## Secrets
Create two files, `secrets-root.env` and `secrets-wildcard.env`, with the following fields:
```
USER=<ddns-user>
PASSWORD=<ddns-password>
```

