#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /usr/bin/python3 /app/bazarr.py --no-update --config /config ${EXTRA_ARGS}
