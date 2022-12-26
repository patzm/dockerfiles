# Pritunl

Enterprise Distributed OpenVPN, IPsec and WireGuard Server.
[link](https://pritunl.com/)

## Setup

Additionally, the following optional and _non-sensitive_ environment variables:
* `PRITUNL_TAG`: overwrites the Docker :whale: image tag

## Notes
The ports `22` and `2222` are exposed such that members of the local network can `ssh` into clients that are connected to the VPN.
