# Frigate

NVR (Network Video Recorder) with AI object detection for IP cameras.

## Setup

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

Note the password that gets logged on the 1st launch.

Access at `https://frigate.patz.app`

## Notes

- CPU-only detection (no GPU/TPU)
- For best performance: use low-resolution sub-streams for detection, reduce fps to 5
- Cameras should be accessible from the server (configure OPNsense firewall if cameras are on different VLAN)