#!/bin/bash

verify () {
  app="${1}"
  version="${2#*v}"
  version="${version#*release-}"

  echo "Building kah-${app}:${version}..."
  docker build -f "${app}/Dockerfile" -t "kah-${app}:${version}" --build-arg VERSION="${version}" --build-arg TARGETPLATFORM="linux/amd64" . 1> /dev/null
  size=$(docker image inspect "kah-${app}:${version}" --format='{{.Size}}')
  echo "Image size: $(echo ${size} | numfmt --to=iec-i --suffix=B)"
}

# version="$(curl -sX GET "https://api.github.com/repos/morpheus65535/bazarr/releases" | jq --raw-output '.[0].tag_name')"
# verify "bazarr" "${version}"
# # docker run --entrypoint="" --rm kah-bazarr:0.9.0.5 python3 /app/bazarr.py -h

# version=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" | jq --raw-output '.tag_name')
# verify "jackett" "${version}"
# # docker run --entrypoint="" --rm kah-jackett:0.16.2080 /app/jackett --version

# version=$(curl -sX GET "https://lidarr.servarr.com/v1/update/nightly/changes?os=linux" | jq --raw-output '.[0].version')
# verify "lidarr" "${version}"
# # docker run --entrypoint="" --rm kah-lidarr:0.8.0.1886 /app/Lidarr

# version=$(curl -sX GET "https://api.github.com/repos/nzbget/nzbget/releases/latest" | jq --raw-output '.tag_name')
# verify "nzbget" "${version}"
# # docker run --entrypoint="" --rm kah-nzbget:21.0 /app/nzbget --version

# version=$(curl -sX GET "https://api.github.com/repos/theotherp/nzbhydra2/releases" | jq --raw-output '.[0].tag_name')
# verify "nzbhydra2" "${version}"
# # docker run --entrypoint="" --rm kah-nzbhydra2:3.4.3 python3 /app/nzbhydra2wrapperPy3.py --version

# version=$(curl -sX GET "https://api.github.com/repos/tidusjar/Ombi.Releases/releases" | jq --raw-output '.[0].tag_name')
# verify "ombi" "${version}"
# # docker run --entrypoint="" --rm kah-ombi:4.0.643 /app/Ombi --version

# version=$(curl -sX GET "https://api.github.com/repos/qbittorrent/qBittorrent/tags" | jq --raw-output '.[0].name')
# verify "qbittorrent" "${version}"
# # # docker run --entrypoint="" --rm kah-qbittorrent:4.3.0.1 /app/qbittorrent-nox --version

# version=$(curl -sX GET "https://radarr.servarr.com/v1/update/nightly/changes?os=linux" | jq --raw-output '.[0].version')
# verify "radarr" "${version}"
# # docker run --entrypoint="" --rm kah-radarr:3.0.0.3989 /app/Radarr

# version=$(curl -sX GET "https://services.sonarr.tv/v1/download/phantom-develop?version=3" | jq --raw-output '.version')
# verify "sonarr" "${version}"
# # docker run --entrypoint="" --rm kah-sonarr:3.0.4.993 /usr/bin/mono --debug /app/Sonarr.exe

# version=$(curl -sX GET "https://registry.hub.docker.com/v1/repositories/library/ubuntu/tags" | jq --raw-output '.[] | select(.name | contains("focal")) | .name'  | tail -n1)
# verify "ubuntu" "${version}"
# # docker run --entrypoint="" --rm kah-ubuntu:focal-20201008 /sbin/tini --version

# version=$(curl -sX GET "https://api.github.com/repos/xteve-project/xTeVe/releases" | jq --raw-output '.[0].tag_name')
# verify "xteve" "${version}"
# # docker run --entrypoint="" --rm kah-xteve:2.1.2.0120 /app/xteve -h
