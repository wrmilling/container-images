#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /usr/bin/python3 /app/Tautulli.py --nolaunch --config /config/config.ini --datadir /config ${EXTRA_ARGS}
