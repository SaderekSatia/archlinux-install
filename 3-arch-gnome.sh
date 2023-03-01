#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

# sudo reflector -c Switzerland -a 12 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Sy

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload
# sudo virsh net-autostart default


sudo pacman -S $(pacman -Ss ttf- | sed -e's/\s.*//')
sudo pacman -S $(pacman -Ss otf- | sed -e's/\s.*//')

sudo pacman -S gdm gnome gnome-extra gnome-tweaks
sudo pacman -S adapta-gtk-theme arc-gtk-theme arc-solid-gtk-theme arc-icon-theme breeze-gtk deepin-gtk-theme gnome-themes-extra materia-gtk-theme mate-themes
sudo pacman -S blender pragha mpv gimp obs-studio firefox libreoffice chromium discord keybase telegram-desktop

sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
