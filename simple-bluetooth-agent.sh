#!/bin/bash

PIN="123321"
NAME="Some-bluetooth"

hciconfig hci0 reset
hciconfig hci0 up
hciconfig hci0 name $NAME
hciconfig hci0 sspmode 0
hciconfig hci0 piscan

expect -c '
    spawn bluetoothctl
    send "agent on\r"
    expect "Agent *registered"
    send "pairable on\r"
    expect "airable"
    send "default-agent\r"
    while {1} \
    {
       expect \
       {
           "Enter PIN code:"         { send "'"$PIN"'\r" }  
           "Authorize service * (yes/no)"       { send "yes\r" }
           eof {puts "\rBreaking - EOF\r" ; break}
       }
    }
    '

