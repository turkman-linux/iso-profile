#!/bin/sh
# X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem --jobs=1
ymp it elogind libtool shadow pipewire wireplumber fuse fuse2 --no-emerge --allow-oem --jobs=1
# install cinnamon
ymp it @cinnamon.base gnome-screenshot caribou dejavu adwaita-icon-theme gsettings-desktop-schemas polkit-gnome gnome-terminal libhandy libunwind seatd touchegg --no-emerge --allow-oem
ymp it gnome-icon-theme gnome-themes-standard --no-emerge --allow-oem
gtk-update-icon-cache /usr/share/icons/hicolor/
# install wifi and bluetooth
ymp it wpa_supplicant networkmanager bluez --no-emerge --allow-oem
# install lightdm
ymp it lightdm-pardus-greeter lightdm --no-emerge --allow-oem
# enable services
rc-update add elogind
rc-update add eudev
rc-update add fuse
rc-update add seatd
rc-update add upowerd
rc-update add hostname
rc-update add wpa_supplicant
rc-update add networkmanager
rc-update add lightdm
rc-update add bluetooth
rc-update add polkit
rc-update add touchegg
