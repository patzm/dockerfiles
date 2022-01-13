# Dynamic DNS
Updates a Dynamic DNS server with the IP of this node.

If the dynamic DNS is running behind a FritzBox, adjust the `cmd` according to [this](https://github.com/linuxserver/docker-ddclient#get-dynamic-ip-from-fritzbox).

**WARNING**: This stack is deprecated.
It doesn't work particularly well.
I switched to using TrueNas' [DDNS service](https://www.truenas.com/docs/core/services/dynamicdns/).

## Secrets
Create two files, `secrets-root.env` and `secrets-wildcard.env`, with the following fields:
```
USER=<ddns-user>
PASSWORD=<ddns-password>
```

