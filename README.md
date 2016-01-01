# Bluez5 (A2DP)
Bluez5 and PulseAudio in a docker for recieve and send sound via a2dp 

**Run command:**

```bash
docker run \
    --device /dev/bus/usb/002/001 \
    --name bluez \
    --net=host \
    --cap-add NET_ADMIN \
    -v /opt/bluetooth:/var/lib/bluetooth
    -e PIN="123321" \
    -e NAME="Some-bluetooth" \
    -e DEVICE="40:EF:4C:C3:9C:CE" \
    -e DEVICE_PIN="0000" \
    kvaps/bluez
```
