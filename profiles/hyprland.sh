#!/bin/sh
#X11 hyprland
ymp repo --update --allow-oem --ignore-gpg
ymp it shadow @hyprland foot waybar libinput libdisplay-info grim slurp dejavu eudev elogind freetype seatd xkeyboard-config @x11.drivers --no-emerge --allow-oem
# TODO: sway dependency
ymp it pango xcb-util-renderutil libbsd libXfont2 libmd brotli gdk-pixbuf --no-emerge --allow-oem
# weston for debug
#ymp it weston --no-emerge --allow-oem

rc-update add elogind
rc-update add eudev
rc-update add seatd
rc-update add devfs
rc-update add udhcpc
