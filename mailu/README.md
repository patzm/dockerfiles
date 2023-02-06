# Mailu

## Setup

Set the following (sensitive) environment variables:
* `RELAYUSER`
* `RELAYPASSWORD`
* `SECRET_KEY`: a 16 byte random key.
  Generate like this:
  ```bash
  apt-get install pwgen
  pwgen 16 1
  ```

Then upload the `mailu.env` file into Portainer and populate the environment.
