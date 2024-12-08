# Storj storage node

Docs: https://storj.dev/node

## Setup
Required environment variables:
- `WALLET`: Ethereum wallet address in the format `0xXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`
- `STORAGE`: the amount of `GB` or `TB` that can be used
- `PORT`: the externally accessible port
- `DATA_ROOT`: the parent directory of the `config` and `identity` folders
- `NODE`: the node name
- `UID`: optional, overwrite the user ID
- `GID`: optional, overwrite the group ID

## Unsecure parametrizable
use `insecure.docker-compose.yml`.
It allows you to specify additional properties, in addition to the above :point_up::
- `STORJ_SECRETS`: path to an `.env` file with Storj secrets like `WALLET`
- `STORJ_INSTANCE`: an identifier for routing HTTP traffic to the dashboard. Needs to match the static redirection rule of Traefik.

## Automatically create an instance
1. Download the Storj binary (follow instructions from [here](https://storj.dev/node/get-started/identity)):

    ```bash
    sudo curl -L https://github.com/storj/storj/releases/latest/download/identity_linux_amd64.zip -o identity_linux_amd64.zip
    unzip -o identity_linux_amd64.zip
    sudo chmod +x identity
    sudo sudo mv identity /mnt/ssd-256gb/docker/storj/identity
    ```

1. Register an authorization token at https://storj.dev/node/get-started/auth-token

1. run `create-node` with the following syntax: `create-node NODE PORT AUTH-TOKEN`
    - the `NODE` needs to match a mounted disk name in `/mnt`
    - the `PORT` needs to be a publicly accessible, *open* port
    - `AUTH-TOKEN` is when we got from the previous step

1. execute the pre-configured commands in order