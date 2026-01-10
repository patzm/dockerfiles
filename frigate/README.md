# Frigate

NVR (Network Video Recorder) with AI object detection for IP cameras.

## Setup

### Environment Variables

Edit `docker-compose.yml`:
- `FRIGATE_RTSP_PASSWORD` - Password for RTSP stream access (change from `changeme`)

### Directories

```bash
mkdir -p /mnt/ssd-1tb/docker/frigate/config
mkdir -p /mnt/hdd-16tb/frigate/media
```

### Configuration

Create `/mnt/ssd-1tb/docker/frigate/config/config.yml` with your camera configuration. See `config.example.yml` for examples.

### Launch

```bash
docker compose up -d
```

Access at `https://frigate.patz.app`

## Notes

- CPU-only detection (no GPU/TPU)
- For best performance: use low-resolution sub-streams for detection, reduce fps to 5
- Cameras should be accessible from the server (configure OPNsense firewall if cameras are on different VLAN)