#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/Radarr -nobrowser -data=/config ${EXTRA_ARGS}
