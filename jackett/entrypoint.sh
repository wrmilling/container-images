#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/jackett --NoUpdates ${EXTRA_ARGS}
