# Open Claw Gateway

Lightweight gateway container definition for Open Claw deployments.

## Quick Start

1. Clone the repository and enter this directory.
2. Generate the gateway token: `OPENCLAW_GATEWAY_TOKEN=$(openssl rand -hex 32)`.
3. Export the token before starting Docker Compose: `export OPENCLAW_GATEWAY_TOKEN`.
4. Start the services: `docker compose up -d`.
