#!/bin/bash
dbus-daemon --system --fork
/usr/lib/bluetooth/bluetoothd &
/bin/simple-bluetooth-agent.sh
