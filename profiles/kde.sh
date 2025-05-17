#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 --no-emerge --allow-oem --jobs=1
# install kde
ymp it @kde.plasma @kde.frameworks dolphin konsole dejavu tzdata seatd --no-emerge --allow-oem --jobs=1
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem
# install sddm
ymp it sddm --no-emerge --allow-oem
# install firefox-installer
ymp it firfox-installer --no-emerge --allow-oem
# install flatpak
ymp it flatpak --no-emerge --allow-oem
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# set timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/UTC /etc/localtime
# enable services
rc-update add elogind
rc-update add eudev
rc-update add fuse
rc-update add seatd
rc-update add upowerd
rc-update add hostname
rc-update add wpa_supplicant
rc-update add networkmanager
rc-update add sddm
rc-update add bluetooth
rc-update add polkit
