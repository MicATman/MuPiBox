#!/bin/bash
#

CONFIG="/etc/mupibox/mupiboxconfig.json"

HOMEP=$(/usr/bin/jq -r .chromium.homep ${CONFIG})
PLAYERSTATE="/tmp/playerstate"

if [ $(head -n1 ${PLAYERSTATE}) = "play" ]; then
  curl -s http://127.0.0.1:5005/pause
fi

sudo killall -r chromium


if [ "$HOMEP" == "http://localhost:8200" ]; then 
            /usr/bin/cat <<< $(/usr/bin/jq --arg v "https://open.spotify.com" '.chromium.homep = $v' ${CONFIG}) >  ${CONFIG}
else
             /usr/bin/cat <<< $(/usr/bin/jq --arg v "http://localhost:8200" '.chromium.homep = $v' ${CONFIG}) >  ${CONFIG}
fi
sleep 1

/var/lib/dietpi/dietpi-software/installed/./chromium-autostart.sh
Echo "Erledigt"

