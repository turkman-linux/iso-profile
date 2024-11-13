#!/bin/bash
rc-update add udhcpc
rc-update add hostname
rc-update add devfs
chmod u+s /usr/bin/su || true
exit 0
