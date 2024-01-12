# OpenProject

URL: https://www.openproject.org/

## Setup

During the initial bring-up, database initialization takes quite some time.
Sometimes up to 5 minutes.
The `seeder` service is responsible for that (I think).

The following optional and _non-sensitive_ environment variables can be set:
* `OPENPROJECT_TAG`: overwrites the Docker :whale: image tag
* `OPENPROJECT_LOG__LEVEL`: overrides the default log level `warn`. Options: [link](https://www.openproject.org/docs/installation-and-operations/operation/monitoring/#raising-the-log-level)
