#!/usr/bin/env bash

version=$(curl -sX GET "https://registry.hub.docker.com/v1/repositories/summerwind/actions-runner/tags" | jq --raw-output 'last(.[].name)')
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
