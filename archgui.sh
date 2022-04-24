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
  echo "1 ->Repositorios de BlackArch"
  echo "2 ->Configura ZSH como Shell por defecto"
  echo "3 ->Instala Oh-my-Zsh" 
  echo "4 ->Instala Plugins"
  echo "5 ->Instala Powerlevel10k"
  echo "6 ->Instala complemento para Neovim(NVchad)"

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
shell ()
{
  chsh -s $which /bin/zsh
  zsh 
}
el
zshcomplementos ()
{

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  echo "Es recomendable reiniciar el entorno para aplicarlos cambios"

}

ohmyzsh ()
{
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

powerlevel10k ()
{
  git clone https://github.com/vegatronica/files.git
  cd files
  unzip hacknerdfonts.zip
  sudo cp *.ttf /usr/share/fonts 
  cd ..
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
}

alias ()
{
  echo "alias instalar='sudo pacman -S'" >> .zshrc
  echo "alias actualizar='sudo pacman -Syu'" >> .zshrc 
  echo "alias vaciar='sudo rm -rf ~/.local/share/Trash/*'" >> .zshrc
}
if [[ $1 == -h ]]; then
 ayuda

elif [[ $1 == 1 ]]; then
  blackarch

elif [[ $1 == 2 ]]; then
  shell 

elif [[ $1 == 3 ]]; then
  powerlevel10k

elif [[ $1 == 4 ]]; then
  zshcomplementos

else
  echo "No se reconoce el comando, vea ayuda con -h"
  
fi
