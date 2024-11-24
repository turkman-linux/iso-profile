#!/bin/bash
rc-update add udhcpc
rc-update add hostname
rc-update add devfs
if [ ! -f /usr/bin/login ] ; then
    ln -s /bin/busybox /usr/bin/login
fi
chmod u+s /usr/bin/su || true
exit 0
