#!/bin/bash

# set timezone
ln -sf /usr/share/zoneinfo/America/Havana /etc/localtime

# sync hardware clock
hwclock --systohc

# localization
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# keymap
#echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf

# network configuration
echo "strange-laptop" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 strange-laptop.localdomain strange-laptop" >> /etc/hosts

# root passwd
echo root:password | chpasswd

# initramfs
mkinitcpio -P

# install packages
pacman -Syu
pacman -S grub efibootmgr os-prober networkmanager network-manager-applet ntfs-3g btrfs-progs dialog wpa_supplicant mtools \
		linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils \
		dnsutils bluez bluez-utils cups hplip alsa-utils \
		pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh reflector \
		acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 \
		openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid  \
		terminus-font dosfstools
# pacman -S nvidia nvidia-utils nvidia-settings

# bootloader
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# enable services
#systemctl enable reflector.timer
systemctl enable NetworkManager
#systemctl enable bluetooth
#systemctl enable cups.service
#systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable fstrim.timer
systemctl enable libvirtd
#systemctl enable firewalld
systemctl enable acpid

# create user
useradd -m strange
echo strange:password | chpasswd
usermod -aG libvirt strange
echo "strange ALL=(ALL) ALL" >> /etc/sudoers.d/strange

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"