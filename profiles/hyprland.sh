#!/bin/sh
#X11 hyprland
ymp repo --update --allow-oem --ignore-gpg
ymp it shadow @hyprland foot libinput libdisplay-info grim slurp dejavu eudev elogind freetype seatd xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
# TODO: sway dependency
ymp it pango xcb-util-renderutil libbsd libXfont2 libmd brotli gdk-pixbuf --no-emerge --allow-oem --jobs=1
# weston for debug
#ymp it weston --no-emerge --allow-oem

rc-update add elogind boot
rc-update add eudev sysinit
rc-update add seatd default
rc-update add udhcpc boot
