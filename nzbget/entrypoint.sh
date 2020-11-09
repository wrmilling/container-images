#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /app/nzbget --server --option OutputMode=log --configfile /config/nzbget.conf ${EXTRA_ARGS}
