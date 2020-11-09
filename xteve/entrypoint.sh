#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/xteve -config /config ${EXTRA_ARGS}
