#!/bin/sh
#X11 install
ymp repo --update --allow-oem --ignore-gpg
ymp it xinit xorg-server xterm freetype xauth xkbcomp xkeyboard-config @x11.drivers --no-emerge --allow-oem
ymp it elogind shadow pipewire wireplumber libtool l3afpad gpicview fuse fuse2 --no-emerge --allow-oem
# FIXME lxpanel dependency
ymp it libexif --no-emerge --allow-oem
ymp it @lxde openbox --no-emerge --allow-oem
echo "startlxde" > /data/user/root/.xinitrc
sed -i "s/#USER/USER/g" /etc/conf.d/xinit
echo "tmpfs /tmp tmpfs rw 0 0" > /etc/fstab
ln -s /proc/mounts /etc/mtab
sed -i "s|#agetty_options.*|agetty_options=\"-l /usr/bin/login\"|" /etc/conf.d/agetty
chmod u+s /usr/bin/su /usr/lib64/polkit-1/*
rc-update add elogind
rc-update add eudev
rc-update add fuse
rc-update add udhcpc
rc-update add hostname
ymp clean --allow-oem
exit 0
