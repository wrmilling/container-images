#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /usr/bin/mono --debug /app/Sonarr.exe -nobrowser -data=/config ${EXTRA_ARGS}
