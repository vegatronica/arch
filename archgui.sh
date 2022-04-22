#!/usr/bin/bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"

banner()
{
  clear
  echo -e "${red}"


echo "▄▄▄       ██▀███   ▄████▄   ██░ ██  "
echo "▒████▄    ▓██ ▒ ██▒▒██▀ ▀█ ▓██░ ██▒ "
echo "▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄▒██▀▀██░ "
echo "░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██░▓█░ ██  "
echo "▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░░▓█▒░██▓ "
echo "▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒ ░░▒░▒ "
echo " ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒    ▒ ░▒░ ░ "
echo " ░   ▒     ░░   ░ ░         ░  ░░ ░ "
echo "     ░  ░   ░     ░ ░       ░  ░  ░ "
echo "                  ░                 "
echo "<VEGATRONICA 2022>"
}

ayuda ()
{ 
  banner
  echo -e "${yellow}"
  echo "-b ->Repositorios de BlackArch"
  echo "-p ->Instala complementos ZSH(PowerLevel10k)"
  echo "-n ->Complemento Neovim(NvChad)"
  echo "-h ->Ayuda"
  echo -e "${end}"
}
nvchad ()
{
 git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
 nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
}

blackarch ()
{
  
  echo "Instalando los repositorios de <BlackArch>"
  mkdir blackarch
  cd blackarch
  curl -O https://blackarch.org/strap.sh
  sudo chmod +x strap.sh 
  sudo su
  ./strap.sh 
  cd ..
  exit
  
}

zsh ()
{
  sudo pacman -S zsh
  echo "Es recomendable reiniciar el entorno para aplicarlos cambios"

}

if [[ $1 == -h ]]; then
 ayuda
elif [[ $1 == -p ]]; then
  zsh
elif [[ $1 == -b ]]; then
  blackarch

else
  echo "No se reconoce el comando, vea ayuda con -h"
  
fi
