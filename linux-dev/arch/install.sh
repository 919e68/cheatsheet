#!/bin/bash

echo 'install arch'

fdisk /dev/sda <<EOF
o
n




t
8e
a
w
EOF

pvcreate --dataalignment 1m /dev/sda1
vgcreate volgroup0 /dev/sda1
lvcreate -l 100%FREE volgroup0 -n lv_root

modprobe dm_mod
vgscan
vgchange -ay

mkfs.ext4 /dev/volgroup0/lv_root
mount /dev/volgroup0/lv_root /mnt

mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab


pacstrap -i /mnt base <<EOF
y
EOF

arch-chroot /mnt
pacman -S linux linux-headers linux-lts linux-lts-headers <<EOF

y
EOF

pacman -S --needed base-devel <<EOF

y
EOF

pacman -S openssh <<EOF
y
EOF

systemctl enable sshd

pacman -S networkmanager wpa_supplicant wireless_tools netctl <<EOF

y
EOF

systemctl enable NetworkManager

pacman -S vim dialog lvm2 <<EOF
y
EOF

# config boot
sed -i '/^HOOKS=(/ s/block filesystems/block lvm2 filesystems/' /etc/mkinitcpio.conf
mkinitcpio -p linux
mkinitcpio -p linux-lts

# config locale
sed -i '/en_PH.UTF-8 UTF-8/s/^#//g' etc/locale.gen
locale-gen

# setup users and password
passwd <<EOF
@!tokyored
@!tokyored
EOF
useradd -m -g users -G wheel athena
passwd athena <<EOF
@!tokyored
@!tokyored
EOF

# update visudo
sed -i '/%wheel ALL=(ALL:ALL) ALL/s/^# //g' /etc/sudoers

# setup grub
pacman -S grub dosfstools os-prober mtools <<EOF
y
EOF
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# boot locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo


# setup datetime
timedatectl set-timezone Asia/Manila
systemctl enable systemd-timesyncd

# extras
pacman -S git <<EOF
y
EOF
pacman -S xorg xorg-xinit <<EOF

y
EOF
pacman -S virtualbox-guest-utils xf86-video-vmware <<EOF
y
EOF
systemctl enable vboxservice

# install desktop
pacman -S gdm gnome-shell gnome-terminal nautilus gnome-control-center <<EOF
y
EOF
pacman -S gnome-tweaks gnome-shell-extensions <<EOF
y
EOF
systemctl enable gdm
