#!/bin/bash
dbus-daemon --system --fork
pulseaudio --log-level=1 &
/usr/lib/bluetooth/bluetoothd --plugin=a2dp -n &
. /bin/simple-bluetooth-agent.sh
