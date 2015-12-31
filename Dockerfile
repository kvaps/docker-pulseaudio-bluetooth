FROM pritunl/archlinux
MAINTAINER kvaps <kvapss@gmail.com>

RUN pacman --noconfirm -Sy bluez bluez-utils expect libdbus pulseaudio-bluetooth libpulse
ADD simple-bluetooth-agent.sh /bin/simple-bluetooth-agent.sh
ADD start.sh /bin/start.sh
RUN mkdir /var/run/dbus

ENTRYPOINT [ "/bin/start.sh" ]
