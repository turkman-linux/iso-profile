#!/bin/bash
set -ex
mkdir /output -p
apt update
apt install git grub-pc-bin grub-efi grub-efi-ia32-bin squashfs-tools mtools xorriso rdfind -y
function build(){
    variant=$1
    suffix=$2
    if [ ! -d $variant$suffix ] ; then
        git clone https://gitlab.com/turkman/devel/assets/mkiso $variant$suffix
    fi
    cd $variant$suffix
    if [ -f ../profiles/$variant.sh ] ; then
        install  ../profiles/$variant.sh custom
    fi
    if [ -f ../common.sh ] ; then
        cat ../common.sh >> custom
    fi
    bash -ex mkiso.sh
    mv turkman.iso /output/turkman-$variant$suffix.iso
    mount -t proc proc rootfs/proc
    chroot rootfs ymp rbd --no-color 2>/dev/null | tee -a /output/turkman-$variant$suffix.revdep-rebuild
    umount -lf rootfs/proc
    cd ..
}
for variant in $(ls profiles/ | sed "s/\.sh//g") ; do
    for fw in 0 1; do
        export FIRMWARE=""
        export CONFIGURE="1"
        suffix=""
        if [[ "$fw" == "1" ]] ; then
            export FIRMWARE=1
            suffix="-firmware"
            # move foss image
            mv $variant $variant$suffix
            export CONFIGURE="0"
        fi
        build $variant $suffix
    done
    rm -rf "$variant"*
done
