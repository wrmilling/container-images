#!/bin/bash

version=$(curl -sX GET "https://api.github.com/repos/tidusjar/Ombi.Releases/releases" | jq --raw-output '.[0].tag_name')
docker build -f ombi/Dockerfile -t kah-ombi:latest --build-arg VERSION="${version#*v}" --build-arg TARGETPLATFORM=linux/amd64 .