#! /bin/bash

set -e

TREE_DIR="$(pwd)"

wget https://buildroot.org/downloads/buildroot-2025.08.2.tar.gz

mkdir "../buildroot" && tar xvf buildroot-2025.08.2.tar.gz --strip-components=1 -C "../buildroot"

cd "../buildroot"

make BR2_EXTERNAL="$TREE_DIR" f2fs_pc_bios_defconfig

make

qemu-system-x86_64 -M pc -drive file=output/images/disk.img,if=virtio,format=raw,cache=writeback
