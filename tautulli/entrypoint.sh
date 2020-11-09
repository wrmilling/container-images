#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /usr/bin/python3 /app/Tautulli.py --datadir /config --nolaunch ${EXTRA_ARGS}
