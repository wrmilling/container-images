# Container Images

<a href="https://app.fossa.com/projects/git%2Bgithub.com%2Fk8s-at-home%2Fcontainer-images?ref=badge_shield" alt="FOSSA Status"><img src="https://app.fossa.com/api/projects/git%2Bgithub.com%2Fk8s-at-home%2Fcontainer-images.svg?type=shield"/></a>

Container images for everyone hosted at https://hub.docker.com/r/k8sathome

## Available Images

| Name        | Docker Image                                                                                                                 |
|-------------|------------------------------------------------------------------------------------------------------------------------------|
| bazarr      | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/bazarr)](https://hub.docker.com/r/k8sathome/bazarr)           |
| jackett     | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/jackett)](https://hub.docker.com/r/k8sathome/jackett)         |
| lidarr      | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/lidarr)](https://hub.docker.com/r/k8sathome/lidarr)           |
| nzbget      | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/nzbget)](https://hub.docker.com/r/k8sathome/nzbget)           |
| nzbhydra2   | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/nzbhydra2)](https://hub.docker.com/r/k8sathome/nzbhydra2)     |
| ombi        | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/ombi)](https://hub.docker.com/r/k8sathome/ombi)               |
| qbittorrent | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/qbittorrent)](https://hub.docker.com/r/k8sathome/qbittorrent) |
| radarr      | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/radarr)](https://hub.docker.com/r/k8sathome/radarr)           |
| sonarr      | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/sonarr)](https://hub.docker.com/r/k8sathome/sonarr)           |
| xteve       | [![Docker Pulls](https://img.shields.io/docker/pulls/k8sathome/xteve)](https://hub.docker.com/r/k8sathome/xteve)             |

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
