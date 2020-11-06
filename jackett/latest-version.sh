#!/usr/bin/env bash

version=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" | jq --raw-output '.tag_name')
echo "${version#*v}"
