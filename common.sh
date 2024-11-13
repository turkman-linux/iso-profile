#!/bin/bash
# fstab add tmpfs
echo "tmpfs /tmp tmpfs rw 0 0" > /etc/fstab
ln -s /proc/mounts /etc/mtab
# enable login from shadow
chmod u+s /usr/bin/su || true
# set language
mkdir -p /lib64/locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "" >> /etc/locale.gen
echo "export LANG=en_US.UTF-8" > /etc/profile.d/locale.sh
echo "export LC_ALL=en_US.UTF-8" >> /etc/profile.d/locale.sh
locale-gen
# polkit enable
chmod u+s /usr/bin/pkexec /usr/lib64/polkit-1/polkit-agent-helper-1 || true
# enable shells
echo "/bin/bash" > /etc/shells
echo "/bin/sh" >> /etc/shells
echo "/bin/ash" >> /etc/shells
# reduce iso size
ymp install no-static --no-emerge --allow-oem
touch /.allow-oem
# ymp clean
ymp clean --allow-oem
