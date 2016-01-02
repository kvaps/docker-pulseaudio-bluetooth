FROM pritunl/archlinux
MAINTAINER kvaps <kvapss@gmail.com>

RUN pacman --noconfirm -Sy bluez bluez-utils expect libdbus pulseaudio-bluetooth libpulse avahi
ADD simple-bluetooth-agent.sh /bin/simple-bluetooth-agent.sh
ADD start.sh /bin/start.sh
RUN mkdir /var/run/dbus
RUN sed 's/^load-module module-console-kit/#load-module module-console-kit/' -i /etc/pulse/default.pa \
    && echo 'load-module module-switch-on-connect' >> /etc/pulse/default.pa \
    && echo 'load-module module-native-protocol-tcp auth-anonymous=1' >> /etc/pulse/default.pa
ENV PULSEAUDIO_SYSTEM_START=1

ENTRYPOINT [ "/bin/start.sh" ]
