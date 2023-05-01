# File Browser

Browser and manipulate files from anywhere, right inside your browser!

Service: https://filebrowser.org/

## Setup
Make sure that the following environment variables are set:
* `PUID`
* `PGID`

For instance, bring up this stack by invoking
```shell
PUID=$(id -u <user>) PGID=$(id -g <user>) docker-compose up -d
```
Where `<user>` is the user whose permissions the file browser shall inherit.
