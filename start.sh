#!/bin/bash
dbus-daemon --system --fork
su pulse -c 'pulseaudio --log-level=4 -D'
/usr/lib/bluetooth/bluetoothd --plugin=a2dp &
. /bin/simple-bluetooth-agent.sh
