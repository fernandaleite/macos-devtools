#!/bin/bash

echo -e "\n\n-----------------------------Instalando Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\n\n-----------------------------Instalando Customizações para o Oh My Zsh"

echo -e "\n\n-----------------------------Instalando Syntax Highlighting"
brew install zsh-syntax-highlighting

echo -e "\n\n-----------------------------Instalando Autosuggestions"
brew install zsh-autosuggestions

echo -e "\n\n Adicionar em ~/.zshrc :: "
echo "plugins=("
echo "		zsh-syntax-highlighting"
echo "		zsh-autosuggestions"
echo ")"

echo -e "\n\n-----------------------------Instalando melhor Buscador"

brew install fzf

echo -e "\n\n-----------------------------Instalando Tema Powerlevel10k"

brew install romkatv/powerlevel10k/powerlevel10k

echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

echo -e "\n\n-----------------------------Instalando font Hack"

curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/download/v1.2.0/Hack.zip -o ~/Downloads/Hack.zip
cd $HOME/Library/Fonts/
unzip ~/Downloads/Hack.zip
echo "POWERLEVEL10K_MODE=\"nerdfont-complete\"" >> ~/.zshrc