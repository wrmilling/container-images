#!/usr/bin/env bash

#shellcheck disable=SC1091
source "/shim/umask.sh"
source "/shim/config.sh"
source "/shim/vpn.sh"

if [[ ! -f "/config/nzbget.conf" ]]; then
    cp /app/nzbget.conf /config/nzbget.conf
fi

exec /app/nzbget --server --option OutputMode=log --configfile /config/nzbget.conf "${EXTRA_ARGS}"
