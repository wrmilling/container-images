#!/usr/bin/env bash

#shellcheck disable=SC1091
source "/shim/umask.sh"
source "/shim/vpn.sh"

exec /app/qbittorrent-nox --webui-port="${WEBUI_PORT}" ${EXTRA_ARGS}
