# OwnTracks

## Setup of mosquitto
[Mosquitto](https://mosquitto.org/) is a message broker that implements the MQTT protocol.
We use the official Docker image: [eclipse-mosquitto](https://hub.docker.com/_/eclipse-mosquitto).

The setup requires creating a password file in `/mosquitto/auth/passwd`.
This has to be done with the `mosquitto_passwd` command inside the container.
Enter the container and run
```shell
mosquitto_passwd /mosquitto/auth/passwd <username>
```
for every use one wishes to create.
