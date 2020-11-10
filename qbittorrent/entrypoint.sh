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

exec /app/qbittorrent-nox --webui-port="${WEBUI_PORT}" ${EXTRA_ARGS}
