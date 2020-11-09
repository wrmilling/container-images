#!/usr/bin/env bash

umask "${UMASK:-0002}"

exec /usr/bin/python3 /app/nzbhydra2wrapperPy3.py --nobrowser --datafolder /config ${EXTRA_ARGS}
