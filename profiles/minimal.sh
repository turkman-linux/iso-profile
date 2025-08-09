#!/bin/bash
rc-update add eudev sysinit
rc-update add udhcpc boot
if [ ! -f /usr/bin/login ] ; then
    ln -s /bin/busybox /usr/bin/login
fi
chmod u+s /usr/bin/su || true
exit 0
