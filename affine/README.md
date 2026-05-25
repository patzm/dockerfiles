# Affine: a Notion open-source alternative

https://affine.pro/

## Setup
The following optional and _non-sensitive_ environment variables can be set:
* `AFFINE_TAG`: overwrites the Docker :whale: image tag

The following required and _sensitive_ environment variables have to be set:
* `DB_PASSWORD`: set a secure database password

## AI with Ollama (self-hosted)
This stack is configured to join the external Docker network `ai` so AFFiNE can reach the `ollama` service at `http://ollama:11434`.

Deployment-machine steps (not tracked in git):
1. Ensure external network `ai` exists (`docker network create ai`)
2. Create or update `/mnt/ssd-1tb/docker/affine/config/config.json` with:

```json
{
  "$schema": "https://github.com/toeverything/affine/releases/latest/download/config.schema.json",
  "copilot": {
    "enabled": true,
    "providers.openai": {
      "apiKey": "ollama",
      "baseUrl": "http://ollama:11434/v1"
    }
  }
}
```

3. Restart AFFiNE: `docker compose up -d`
4. In AFFiNE Admin → AI, set model IDs to models that exist in your Ollama instance.
