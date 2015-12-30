#!/bin/bash
dbus-daemon --system --fork
/usr/libexec/bluetooth/bluetoothd &
/bin/simple-bluetooth-agent.sh
