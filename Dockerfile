FROM pritunl/archlinux
MAINTAINER kvaps <kvapss@gmail.com>

RUN pacman --noconfirm -Sy bluez bluez-utils expect libdbus pulseaudio-bluetooth libpulse
ADD simple-bluetooth-agent.sh /bin/simple-bluetooth-agent.sh
ADD start.sh /bin/start.sh
RUN mkdir /var/run/dbus
RUN useradd --create-home --home-dir /home/pulse pulse \
    && usermod -aG audio pulse \
    && chown -R pulse:pulse /home/pulse
RUN sed 's/^load-module module-console-kit/#load-module module-console-kit/' -i /etc/pulse/default.pa

ENTRYPOINT [ "/bin/start.sh" ]
