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

# if [[ ! -f "/config/nzbget.conf" ]]; then
#     cp /app/nzbget.conf /config/nzbget.conf
# fi

exec /app/nzbget --server --option OutputMode=log --configfile /config/nzbget.conf ${EXTRA_ARGS}
