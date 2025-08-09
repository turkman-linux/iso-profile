#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 --no-emerge --allow-oem --jobs=1
# install lxde
ymp it @lxde openbox --no-emerge --allow-oem
# install firefox-installer
ymp it firefox-installer --no-emerge --allow-oem
# install flatpak
ymp it flatpak --no-emerge --allow-oem
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem
# install lightdm
ymp it lightdm-pardus-greeter lightdm --no-emerge --allow-oem
rc-update add wpa_supplicant default
rc-update add networkmanager default
rc-update add lightdm default
rc-update add bluetooth default
# enable services
rc-update add elogind boot
rc-update add eudev sysinit
rc-update add fuse sysinit
