#!/bin/sh
BTUSB_DEV="13d3:3568"
BTUSB_BINDING="$(lsusb -d "$BTUSB_DEV" |
    cut -f 1 -d : |
    sed -e 's,Bus ,,' -e 's, Device ,/,' |
    xargs -I {} udevadm info -q path -n /dev/bus/usb/{} |
    xargs basename)"


echo "Disabling autosuspend for Bluetooth USB Soundcard: $BTUSB_BINDING..."
echo -1 > "/sys/bus/usb/devices/$BTUSB_BINDING/power/autosuspend_delay_ms"