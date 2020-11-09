#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/qbittorrent-nox --webui-port="${WEBUI_PORT}" ${EXTRA_ARGS}
