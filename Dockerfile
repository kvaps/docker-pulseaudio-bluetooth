FROM centos:centos7
MAINTAINER kvaps <kvapss@gmail.com>

RUN yum -y update
RUN yum -y install expect pulseaudio pulseaudio-utils pulseaudio-module-bluetooth bluez
ADD simple-bluetooth-agent.sh /bin/simple-bluetooth-agent.sh
ADD start.sh /bin/start.sh
RUN mkdir /var/run/dbus

ENTRYPOINT [ "/bin/start.sh" ]
