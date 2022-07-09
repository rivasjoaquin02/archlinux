# ArchLinux installation by strange

Installation with (BTRFS, ZRAM, GNOME)

## original
https://gitlab.com/eflinux/arch-basic

## My Notion Page:
https://the-strange-xd.notion.site/ArchLinux-3c61b01b42c14b38b1487ebcef7d8b92


## A small summary:

1. If needed, load your keymap
2. Refresh the servers with pacman -Syy
3. Partition the disk
4. Format the partitions
5. Mount the partitions
6. Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git nano intel-ucode (or amd-ucode))
7. Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/FSTAB
8. Chroot in with arch-chroot /mnt
9. Download the git repository with git clone https://github.com/rivasjoaquin02/archlinux
10. cd archlinux
11. chmod +x base.sh
12. run with ./base.sh
