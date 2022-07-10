#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

#sudo reflector -c Cuba -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload
#sudo virsh net-autostart default

# update
sudo pacman -Sy

# gnome
echo "gnome 1 3-10 12-16 18-22 24 26 28-37 39-47 49-50 52 54 56 58 59"
echo "gnome-extra 19 27 28 29 36"
sudo pacman -S xorg gdm gnome gnome-extra gnome-tweaks

# fonts
sudo pacman -S --noconfirm dina-font tamsyn-font ttf-bitstream-vera ttf-croscore ttf-dejavu \
    ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine \
    noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro \
    ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code \
    ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts \
    cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode \
    adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk \
    noto-fonts-emoji
            
sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
