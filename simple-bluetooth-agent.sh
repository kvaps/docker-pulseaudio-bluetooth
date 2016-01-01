#!/bin/bash

hciconfig hci0 reset
hciconfig hci0 up
hciconfig hci0 name $NAME
hciconfig hci0 sspmode 0
hciconfig hci0 piscan

expect -c '
    spawn bluetoothctl
    send "pairable on\r"
    send "agent on\r"
    expect "Agent registered"
    send "default-agent\r"
    expect "Default agent request successful"
    set timeout 3
    set paired False
    send "paired-devices\r"
    expect "'$DEVICE'" { set paired True }
    set timeout -1

    if { $paired == False } {
         send "scan on\r"
         expect "Device *'$DEVICE'"
         send "scan off\r"
         send "pair '$DEVICE'\r"
         expect "Enter PIN code:"         { send "'"$DEVICE_PIN"'\r" }
         expect "\[bluetooth\]*#"
         send "connect '$DEVICE'\r"
    }

    while {1} \
    {
       expect \
       {
           "Enter PIN code:"         { send "'"$PIN"'\r" }  
           "ice * (yes/no)"       { send "yes\r" }
           eof {puts "\rBreaking - EOF\r" ; break}
       }
    }
    '

