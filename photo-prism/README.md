# PhotoPrism

Watch your images and videos from any, plus organize and edit them!

## Setup
The following optional and _non-sensitive_ environment variables can be set:
* `PHOTOPRISM_TAG`: overwrites the Docker :whale: image tag

## Running
* Help:
  ```bash
  docker-compose exec photoprism photoprism help
  ```
* Config:
  ```bash
  docker-compose exec photoprism photoprism config
  ```
* Reset:
  ```bash
  docker-compose exec photoprism photoprism reset
  ```
* Backup:
  ```bash
  docker-compose exec photoprism photoprism backup -a -i
  ```
* Restore:
  ```bash
  docker-compose exec photoprism photoprism restore -a -i
  ```
* Index:
  ```bash
  docker-compose exec photoprism photoprism index
  ```
* Reindex:
  ```bash
  docker-compose exec photoprism photoprism index -f
  ```
* Import:
  ```bash
  docker-compose exec photoprism photoprism import
  ```

To search originals for faces without a complete rescan:
```bash
docker-compose exec photoprism photoprism faces index
```

All commands may have to be prefixed with `sudo` when not running as `root`.
This will point the home directory shortcut `~` to `/root` in volume mounts.
