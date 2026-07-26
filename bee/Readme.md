# Bee Flow stack (local Ollama)

Self-hosted Bee Flow with Ollama as model provider, exposed as `https://bee.patz.app`.

## Prerequisites

- Docker + Docker Compose plugin
- External Docker networks already present:
  - `traefik`
  - `ai` (same network as `ai/docker-compose.yml`)
- Running Ollama endpoint, either:
  - in Docker on `ai` network: `http://ollama:11434`
  - on Docker host: `http://host.docker.internal:11434`

## Files

- `docker-compose.yml`
- `.env` (template; fill in required values)

## Setup

1. Edit `.env` and set required values:
   - `SESSION_SECRET`
   - `MASTER_ENCRYPTION_KEY`
   - `DB_PASSWORD`
   - `OLLAMA_BASE_URL`

2. Create required host paths for bind mounts:

```bash
mkdir -p /mnt/ssd-1tb/docker/bee/postgres
mkdir -p /mnt/ssd-1tb/docker/bee/data
```

3. Start:

```bash
docker compose up -d
```

4. Check health and logs:

```bash
docker compose ps
docker compose logs -f beeflow-server
docker compose logs -f agent-hub
```

## Access

- Bee Flow UI: `https://bee.patz.app`
- API health (from server container): `http://127.0.0.1:3001/api/health`

Traefik routes `bee.patz.app` to `agent-hub` (port 80).

## Ollama configuration

- Docker-network Ollama:
  - `OLLAMA_BASE_URL=http://ollama:11434`
- Host Ollama:
  - `OLLAMA_BASE_URL=http://host.docker.internal:11434`

Linux host access is enabled via:

```yaml
extra_hosts:
  - "host.docker.internal:host-gateway"
```

## Bee Flow UI steps

1. Open `https://bee.patz.app`
2. Go to **Admin → AI settings**
3. Confirm Ollama is available
4. In **Studio**, create an agent and select an available Ollama model

No external provider API key is required for local-only Ollama.

## Troubleshooting

### Bee Flow cannot reach Ollama

- Verify `OLLAMA_BASE_URL` is set and not `localhost`
- Test from server container:

```bash
docker compose exec beeflow-server node -e "const u=(process.env.OLLAMA_BASE_URL||'')+'/api/tags';require('http').get(u,(r)=>{console.log(r.statusCode);process.exit(r.statusCode===200?0:1)}).on('error',()=>process.exit(1));"
```

### `ollama` hostname not found

- Ensure Ollama container is attached to external `ai` network
- Ensure Bee Flow stack is running with `ai` network connected

### `bee.patz.app` not reachable

- Ensure Traefik is running and attached to external `traefik` network
- Check `agent-hub` labels and container health
