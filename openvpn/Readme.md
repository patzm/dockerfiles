
## Configuration
Set up the initial configuration, add `--force` if one already exists and you wish to overwrite it.
```shell
ovpn-init
```

Then to point to the new certificate files:
```shell
sacli --key "cs.priv_key" --value_file "/usr/local/openvpn_as/etc/web-ssl-traefik/key.pem" ConfigPut
sacli --key "cs.cert" --value_file "/usr/local/openvpn_as/etc/web-ssl-traefik/cert.pem" ConfigPut
sacli --key "cs.ca_bundle" --value_file "/usr/local/openvpn_as/etc/web-ssl-traefik/cert.pem" ConfigPut
```

## Links
The best guide so far: https://goneuland.de/openvpn-acces-server-mit-docker-compose-und-traefik-installieren/
