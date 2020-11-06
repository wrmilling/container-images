#!/usr/bin/env bash

version=$(curl -sX GET "https://lidarr.servarr.com/v1/update/nightly/changes?os=linux" | jq --raw-output '.[0].version')
echo "${version}"
