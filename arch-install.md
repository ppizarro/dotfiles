# Archlinux Install

dhcpcd
ip a
efivar -l
fdisk -l
cfdisk /dev/sda
cfdisk /dev/sdb
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sdb1
mount /dev/sda1 /mnt
mkdir -p /mnt/data
mount /dev/sdb1 /mnt/data
pacstrap -i /mnt base base-devel
genfstab -U -p /mnt >> /mnt/etc/fstab
vim /mnt/etc/fstab
arch-chroot /mnt
vi /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
echo FONT=ter-powerline-v14n >> /etc/vconsole.conf
echo pizarro-vm > /etc/hostname
vi /etc/hosts
	127.0.0.1	localhost.localdomain	localhost	pizarro-vm
	::1			localhost.localdomain	localhost

passwd
rm /etc/localtime
ln -s /usr/share/zoneinfo/Brasil/East /etc/localtime
hwclock --systohc --utc
pacman -S wpa_supplicant dialog
pacman -S grub
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
reboot
dhcpcd enp2s0
useradd -m -G wheel -s /bin/bash pizarro
passwd pizarro
visudo
sudo passwd -u root
curl -o mirrorlist http://www.archlinux.org/mirrorlist?contry=BR
