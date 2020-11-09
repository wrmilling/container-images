#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/Lidarr -nobrowser -data=/config ${EXTRA_ARGS}
