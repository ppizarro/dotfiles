# Archlinux Install

## Connect to the internet

### Ethernet—plug in the cable
```
dhcpcd
```

### Wi-Fi—authenticate to the wireless network using iwctl
```
pacman -S iwd
iwctl --passphrase passphrase station wlan0 connect SSID
iwctl
> device list
> station wlan0 scan
> station wlan0 get-networks
> station wlan0 connect SSID
```
### Wi-Fi—authenticate to the wireless network using wpa_supplicant
```
vim /etc/wpa_supplicant/wpa_supplicant.conf
	ctrl_interface=/run/wpa_supplicant
	update_config=1
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
wpa_cli
> scan
> scan_results
> add_network
> set_network 0 ssid "MYSSID"
> set_network 0 psk "passphrase"
> enable_network 0
> save_config
> quit
```

### Update the system clock
```
ip a
timedatectl set-ntp true
```

### Partition the disks
```
efivar -l
fdisk -l
cfdisk /dev/sda
	sda1 EFI system (260M)
	sda2 linux (465.5G)
cfdisk /dev/sdb
	sdb1 linux (22.4G)
```

### Format the partitions and mount the file systems
```
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sdb1
mount /dev/sda2 /mnt
mkdir -p /mnt/data
mount /dev/sdb1 /mnt/data
```

### Installation
```
pacstrap -i /mnt base linux linux-firmware neovim
genfstab -U -p /mnt >> /mnt/etc/fstab
check: vim /mnt/etc/fstab
arch-chroot /mnt
ln -s /usr/share/zoneinfo/Brasil/East /etc/localtime
hwclock --systohc --utc
nvim /etc/locale.gen
	en_US.UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
echo FONT=ter-powerline-v14n >> /etc/vconsole.conf
echo ppizarro-vm > /etc/hostname
nvim /etc/hosts
	127.0.0.1	localhost
	::1		localhost

passwd
pacman -S intel-ucode
mkinitcpio -P
pacman -S grub efibootmgr dosfstools
mkfs.fat -F32 /dev/sda1
mkdir -p /efi
mount /dev/sda1 /efi
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
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
```
