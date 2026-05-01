```
████████ ██████   █████  ██████  ███████     ███████ ████████  █████  ████████ ██  ██████  ███    ██ 
   ██    ██   ██ ██   ██ ██   ██ ██          ██         ██    ██   ██    ██    ██ ██    ██ ████   ██ 
   ██    ██████  ███████ ██   ██ █████       ███████    ██    ███████    ██    ██ ██    ██ ██ ██  ██ 
   ██    ██   ██ ██   ██ ██   ██ ██               ██    ██    ██   ██    ██    ██ ██    ██ ██  ██ ██ 
   ██    ██   ██ ██   ██ ██████  ███████     ███████    ██    ██   ██    ██    ██  ██████  ██   ████ 

	A terminal-based trading workspace powered by OpenBB
```

<div align="center">

[![Docker Publish](https://github.com/FlipTheDream/tradeterminal/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/FlipTheDream/tradeterminal/actions/workflows/docker-publish.yml)
![Docker Image Version](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2FFlipTheDream%2Ftradeterminal%2Fmain%2F.github%2Fworkflows%2Fdocker-publish.yml&query=%24.on.push.tags%5B0%5D&label=tags&color=blue)

</div>

---

## Overview

Run a full trading terminal workspace inside Docker — no dependency headaches, just `docker compose up`.

---

## Quick Start

### Pull & run the prebuilt image

```bash
docker compose -f docker-compose.pull.yml up -d
```

Open [http://localhost:5173](http://localhost:5173) in your browser.

### Pull a specific version

Edit `docker-compose.pull.yml` and change the image tag, e.g.:

```yaml
image: ghcr.io/flipthedream/tradeterminal:v0.0.1
```

### Build the image locally

```bash
docker compose up -d --build
```

---

## Available Tags

| Tag         | Description                  |
|-------------|------------------------------|
| `latest`    | Most recent tagged release   |
| `v1`        | Latest `v1.x.x` release      |
| `v1.2`      | Latest `v1.2.x` release      |
| `v1.2.3`    | Pinned to a specific version |

Full list available at [GitHub Packages](https://github.com/FlipTheDream/tradeterminal/pkgs/container/tradeterminal).

---

## Ports

| Host Port | Container Port | Purpose      |
|-----------|---------------|--------------|
| `5173`    | `5173`        | Web UI       |

---

## Persistence

The `openbb_platform/` directory on your host is mounted into the container at `/root/.openbb_platform`, preserving OpenBB platform data across container restarts.

---

## Requirements

- [Docker](https://docs.docker.com/get-docker/) 20.10+
- [Docker Compose](https://docs.docker.com/compose/install/) v2+
