# Container Images

<a href="https://app.fossa.com/projects/git%2Bgithub.com%2Fk8s-at-home%2Fcontainer-images?ref=badge_shield" alt="FOSSA Status"><img src="https://app.fossa.com/api/projects/git%2Bgithub.com%2Fk8s-at-home%2Fcontainer-images.svg?type=shield"/></a>

Container images for everyone hosted at https://hub.docker.com/r/k8sathome

## Available Images

| Name | Docker Image | Architecture | Upstream Issue |
|------|--------------|--------------|----------------|
| apcupsd-exporter | [![Docker Pulls](https://img.shields.io/docker/pulls/raspbernetes/apcupsd-exporter)](https://hub.docker.com/r/raspbernetes/apcupsd-exporter) | `arm/arm64/amd64` | N/A |

## why?

- Semantic versioning is awesome
- s6-overlay is not awesome
- ARM architectures are gaining popularity
- Multiple architecture support (amd64, arm64, armv7)
- Simplicity over complexity (e.g. only ubuntu:focal)

## image details

- Application configs are in `/config`
- Application binaries are `/app`
- `UMASK` and `TZ` environment variables
