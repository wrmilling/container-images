#!/usr/bin/env bash

umask "${UMASK:-0002}"

WAIT_FOR_VPN=${WAIT_FOR_VPN:-"false"}

if
    [[ "${WAIT_FOR_VPN}" == "true" ]];
then
    echo "Waiting for VPN to be connected..."
    while ! grep -q "connected" /shared/vpnstatus;
    do 
        echo "VPN Not connected"
        sleep 2
    done
    echo "VPN Connected, starting Jackett"
fi

exec /usr/bin/python3 /app/bazarr.py --no-update --config /config ${EXTRA_ARGS}
