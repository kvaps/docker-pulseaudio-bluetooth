!#/bin/bash

PIN="123321"

hciconfig hci0 sspmode 0

expect -c '
    spawn bluetoothctl
    send "agent on\r"
    expect "Agent registered"
    send "default-agent\r"
    set timeout -1
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
