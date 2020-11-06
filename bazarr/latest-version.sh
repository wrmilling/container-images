#!/usr/bin/env bash

version="$(curl -sX GET "https://api.github.com/repos/morpheus65535/bazarr/releases" | jq --raw-output '.[0].tag_name')"
echo -n "${version#*v}"
