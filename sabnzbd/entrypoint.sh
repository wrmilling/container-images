#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /usr/bin/python3 /app/SABnzbd.py --browser 0 --server 0.0.0.0:8080 --config-file /config/sabnzbd.ini ${EXTRA_ARGS}
