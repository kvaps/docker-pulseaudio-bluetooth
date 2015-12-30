FROM centos:centos7
MAINTAINER kvaps <kvapss@gmail.com>

RUN yum -y update
RUN yum -y install pulseaudio pulseaudio-utils pulseaudio-module-bluetooth bluez
ADD simple-bluetooth-agent.sh /bin/simple-bluetooth-agent.sh

ENTRYPOINT [ "dbus-daemon --system --fork && /usr/libexec/bluetooth/bluetoothd && /bin/simple-bluetooth-agent.sh" ]
