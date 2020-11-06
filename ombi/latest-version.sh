#!/usr/bin/env bash

version=$(curl -sX GET "https://api.github.com/repos/tidusjar/Ombi.Releases/releases" | jq --raw-output '.[0].tag_name')
echo "${version#*v}"
