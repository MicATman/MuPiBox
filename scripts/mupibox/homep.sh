#!/bin/bash
#
# 1. Shows Shutdown Splash
# 2. Update settings
# 3. Plays shutdown sound

CONFIG="/etc/mupibox/mupiboxconfig.json"
SHUT_SOUND=$(/usr/bin/jq -r .mupibox.shutSound ${CONFIG})
AUDIO_DEVICE=$(/usr/bin/jq -r .mupibox.audioDevice ${CONFIG})
START_VOLUME=$(/usr/bin/jq -r .mupibox.startVolume ${CONFIG})
PLAYERSTATE="/tmp/playerstate"
HOMEP=$(/usr/bin/jq -r .chromium.homep ${CONFIG})

/usr/bin/cat <<< $(/usr/bin/jq --arg v "http://localhost:8200" '.chromium.homep = $v' ${CONFIG}) >  ${CONFIG}
