#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow fuse fuse2 --no-emerge --allow-oem --jobs=1
# enable services
rc-update add elogind boot
rc-update add eudev sysinit
rc-update add udhcpc boot
