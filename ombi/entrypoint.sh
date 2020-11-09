#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/Ombi --host http://0.0.0.0:3579 --storage /config ${EXTRA_ARGS}
