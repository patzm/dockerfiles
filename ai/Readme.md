# AI Stack with Open WebUI and Ollama

## Setup

### Create external networks
Before bringing up this stack, create the external networks:
```bash
docker network create ai
```

### Environment Variables
Set the following environment variables in `.env` or export them:

**Required for OAuth:**
* `OAUTH_CLIENT_ID`: Client ID from KeyCloak for Open WebUI
* `OAUTH_CLIENT_SECRET`: Client secret from KeyCloak for Open WebUI

**Optional:**
* `OLLAMA_TAG`: overwrites the Docker :whale: image tag for Ollama (default: `latest`)
* `OPEN_WEBUI_TAG`: overwrites the Docker :whale: image tag for Open WebUI (default: `main`)
* `OAUTH_PROVIDER_NAME`: display name for OAuth provider (default: `KeyCloak`)
* `OPENID_PROVIDER_URL`: OpenID configuration URL (default: `https://keycloak.patz.app/realms/master/.well-known/openid-configuration`)
* `OAUTH_SCOPES`: OAuth scopes to request (default: `openid profile email`)

### Configure KeyCloak Client
1. Login to KeyCloak at `https://keycloak.patz.app`
2. Navigate to your realm (e.g., `master`)
3. Create a new client:
   - Client ID: `open-webui` (or your chosen ID)
   - Client Protocol: `openid-connect`
   - Access Type: `confidential`
   - Valid Redirect URIs: `https://chat.patz.app/*`
   - Web Origins: `https://chat.patz.app`
4. Save and copy the client secret from the Credentials tab
5. Set `OAUTH_CLIENT_ID` and `OAUTH_CLIENT_SECRET` in your environment

### Start the stack
Bring up this stack by invoking:
```bash
docker compose up -d
```

## Services

- **Ollama**: LLM runtime accessible at `https://ollama.patz.app`
- **Open WebUI**: Web interface for chat accessible at `https://chat.patz.app`

## Data Storage

Persistent data is stored on the host at:
- Ollama models: `/mnt/ssd-1tb/docker/ai/ollama`
- Open WebUI data: `/mnt/ssd-1tb/docker/ai/open-webui`

## Networks

- `ai`: External network allowing other services to communicate with Ollama
- `auth_internal`: Connection to KeyCloak for OAuth authentication
- `traefik`: Ingress routing for both services
