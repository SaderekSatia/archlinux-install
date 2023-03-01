#!/bin/bash

mkfs.btrfs -L Root -f /dev/nvme0n1p2
mkfs.btrfs -L Home -f /dev/nvme0n1p4

mount -o noatime,space_cache=v2,compress=zstd,ssd,discard=async /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p3
mount -o noatime,space_cache=v2,compress=zstd,ssd,discard=async /dev/nvme0n1p4 /mnt/home

shopt -s extglob
cd /mnt/boot
rm -rv !("EFI")
cd /mnt/boot/EFI
rm -rv !("Boot"|"Microsoft")
cd

pacstrap -K /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

cp ../archlinux-install /mnt

arch-chroot /mnt
