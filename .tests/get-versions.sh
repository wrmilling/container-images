#!/bin/bash

version="$(curl -sX GET "https://api.github.com/repos/morpheus65535/bazarr/releases" | jq --raw-output '.[0].tag_name')"
echo "bazarr : ${version#*v}"

version=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" | jq --raw-output '.tag_name')
echo "jackett : ${version#*v}"

version=$(curl -sX GET "https://lidarr.servarr.com/v1/update/nightly/changes?os=linux" | jq --raw-output '.[0].version')
echo "lidarr : ${version}"

version=$(curl -sX GET "https://api.github.com/repos/nzbget/nzbget/releases/latest" | jq --raw-output '.tag_name')
echo "nzbget : ${version#*v}"

version=$(curl -sX GET "https://api.github.com/repos/theotherp/nzbhydra2/releases" | jq --raw-output '.[0].tag_name')
echo "nzbhydra2 : ${version#*v}"

version=$(curl -sX GET "https://api.github.com/repos/tidusjar/Ombi.Releases/releases" | jq --raw-output '.[0].tag_name')
echo "ombi : ${version#*v}"

version=$(curl -sX GET "https://api.github.com/repos/qbittorrent/qBittorrent/tags" | jq --raw-output '.[0].name')
echo "qbittorrent : ${version}"

version=$(curl -sX GET "https://radarr.servarr.com/v1/update/nightly/changes?os=linux" | jq --raw-output '.[0].version')
echo "radarr : ${version}"

version=$(curl -sX GET "https://services.sonarr.tv/v1/download/phantom-develop?version=3" | jq --raw-output '.version')
echo "sonarr : ${version}"

version=$(curl -sX GET "https://registry.hub.docker.com/v1/repositories/library/ubuntu/tags" | jq --raw-output '.[] | select(.name | contains("focal")) | .name'  | tail -n1)
echo "ubuntu : ${version}"

version=$(curl -sX GET "https://api.github.com/repos/xteve-project/xTeVe/releases" | jq --raw-output '.[0].tag_name')
echo "xteve : ${version}"
