#!/usr/bin/bash


loadkeys us
timedatectl set-ntp true
echo "ArchLinux Script Install Ver 0.01"
echo "VEGATRONICA 2022"
lsblk

read -p "Define tu particion ext4: " part1

mkfs.ext4 /dev/$part1 

read -p "Define tu particion SWAP: " part2 

mkswap /dev/$part2 
swapon

mount /dev/$part1 /mnt 

pacstrap /mnt linux linux-firmware base base-devel grub networkmanager wpa_supplicant nano sudo neofetch

genfstab -U /mnt > /mnt/etc/fstab

cat << EOF > /mnt/arch2.sh 

systemctl enable NetworkManager
systemctl ebnable wpa_supplicant
ln -sf /usr/share/zoneinfo/America/Mexico /etc/localtime
hwclock --systohc
echo "Define Password de ROOT"
passwd 

read -p "Escribe tu nombre de usuario: " usuario
useradd -m $usuario 
echo "Crea password para el usuario $usuario"
passwd $usuario

echo "Agregando al usuario $usuario al grupo wheel"
usermod -aG wheel $usuario 
sleep 1

echo "Configurando Sudoers"
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers 
sleep 1

echo "Configurando Idioma"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen 
echo "es_MX.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen 
sleep 1


echo "Configurando teclado"
echo "KEYMAP=us" > /etc/vconsole.conf 

read -p "Escribe el nombre de tu maquina" maquina

echo 127.0.0.1 localhost >> hosts
echo ::1 localhost >> hosts 
echo 127.0.0.1 $maquina.localhost $maquina 

grub-install /dev/sda
mkdir /boot/grub
grub-mkconfig /boot/grub/grub.cfg 



EOF

sudo chmod +x /mnt/arch2.sh 
arch-chroot /mnt/arch2.sh 

