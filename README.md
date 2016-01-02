# Pulseaudio server with bluetooth (A2DP) support
Bluez5 and PulseAudio in a docker for recieve and send sound via a2dp 

**Run command:**

```bash
docker run \
    --device /dev/bus/usb/002/001 \
    --name bluez \
    --net=host \
    --cap-add NET_ADMIN \
    -v /opt/bluetooth:/var/lib/bluetooth \
    -e PIN="123321" \
    -e NAME="Some-bluetooth" \
    -e DEVICE="40:EF:4C:C3:9C:CE" \
    -e DEVICE_PIN="0000" \
    kvaps/pulseaudio-bluetooth
```

**docker-compose.yml**
```yaml
pulseaudio-bluetooth:
  restart: always
  image: kvaps/pulseaudio-bluetooth
  devices:
    - /dev/bus/usb/002/001
  net: host
  cap_add:
    - NET_ADMIN
  volumes:
    - /etc/localtime:/etc/locialtime:ro
    - ./bluetooth:/var/lib/bluetooth
  environment:
    - PIN=123321
    - NAME=Some-bluetooth
    - DEVICE=40:EF:4C:C3:9C:CE
    - DEVICE_PIN=0000
```
