#!/usr/bin/env bash

version=$(curl -sX GET "https://registry.hub.docker.com/v1/repositories/library/ubuntu/tags" | jq --raw-output '.[] | select(.name | contains("focal")) | .name'  | tail -n1)
echo "${version}"
