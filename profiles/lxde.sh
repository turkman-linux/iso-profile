#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 --no-emerge --allow-oem --jobs=1
# install lxde
# FIXME lxpanel dependency
ymp it libexif --no-emerge --allow-oem
ymp it @lxde openbox --no-emerge --allow-oem
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem
# install lightdm
ymp it lightdm-pardus-greeter lightdm --no-emerge --allow-oem
rc-update add wpa_supplicant
rc-update add networkmanager
rc-update add lightdm
rc-update add bluetooth
# enable services
rc-update add elogind
rc-update add eudev
rc-update add fuse
rc-update add hostname
