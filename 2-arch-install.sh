#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "anarki" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 anarki.localdomain anarki" >> /etc/hosts

printf "\e[1;32mMasukan Kata Sandi ROOT\e[0m\n"
passwd

# pacman -S acpid acpi acpi_call
pacman -S e2fsprogs btrfs-progs dosfstools exfatprogs f2fs-tools ntfs-3g mtools gvfs gvfs-smb efivar efitools efibootmgr grub grub-btrfs os-prober
pacman -S alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-audio pipewire-media-session pipewire-jack noise-suppression-for-voice
pacman -S networkmanager network-manager-applet avahi dialog wpa_supplicant nfs-utils inetutils dnsutils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld nss-mdns bluez bluez-utils aria2 openssh shadowsocks simple-obfs android-tools net-tools
pacman -S libvirt virt-manager edk2-ovmf bridge-utils make fakeroot
pacman -S bash-completion git gvim neovim neovide
pacman -S xf86-video-amdgpu

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Archlinux --removable

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
# systemctl enable acpid
# systemctl enable cups.service
# systemctl enable sshd
# systemctl enable avahi-daemon
# systemctl enable tlp
# systemctl enable reflector.timer
# systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld

useradd -m sadereksatia
usermod -aG wheel sadereksatia
usermod -aG libvirt sadereksatia

printf "\e[1;32mMasukan Kata Sandi USER\e[0m\n"
passwd sadereksatia

nano /etc/sudoers

# Ganti menggunakan whell >> echo "sadereksatia ALL=(ALL) ALL" >> /etc/sudoers.d/sadereksatia

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
