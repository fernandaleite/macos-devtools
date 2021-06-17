#!/bin/bash

echo "#####################################"
echo "###     Instalando Ferramentas    ###"
echo "#####################################"

echo -e "\n\n-----------------------------Instalando Postman"
brew cask install postman

echo -e "\n\n-----------------------------Instalando Sublime"
brew cask install sublime-text

echo -e "\n\n-----------------------------Instalando Spetacle"
brew cask install spectacle

echo -e "\n\n-----------------------------Instalando Docker"
curl -fsSL https://download.docker.com/mac/stable/Docker.dmg -o ~/Downloads/Docker.dmg
open ~/Downloads/Docker.dmg
sudo cp -R /Volumes/Docker/Docker.app /Applications/

echo -e "\n\n-----------------------------Instalando Zoom"
curl -fsSL https://zoom.us/client/latest/Zoom.pkg -o ~/Downloads/zoom.pkg
installer -pkg ~/Downloads/zoom.pkg -target /

echo -e "\n\n-----------------------------Instalando Google Chrome"
curl -fsSL https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o ~/Downloads/googlechrome.dmg
open ~/Downloads/googlechrome.dmg
sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/

echo -e "\n\n-----------------------------Instalando Visual Studio Code"
brew update
brew cask install visual-studio-code

echo -e "\n\n-----------------------------Instalando Extensões do Visual Studio Code"
code --install-extension hashicorp.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ahmadalli.vscode-nginx-conf
code --install-extension esbenp.prettier-vscode
code --install-extension mikestead.dotenv
code --install-extension sidthesloth.html5-boilerplate
code --install-extension hdg.live-html-previewer
code --install-extension vscode-icons-team.vscode-icons
code --install-extension golang.go
code --install-extension ms-python.python
code --install-extension wingrunr21.vscode-ruby

echo -e "\n\n-----------------------------Instalando JetBrains Toolbox"
curl -fsSL https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.18.7609.dmg -o ~/Downloads/jetbrains-toolbox.dmg
open ~/Downloads/jetbrains-toolbox.dmg
sudo cp -r /Volumes/JetBrains\ Toolbox/JetBrains\ Toolbox.app /Applications/

echo -e "\n\n-----------------------------Instalando Xcode 12.4"
curl "https://download.developer.apple.com/Developer_Tools/Xcode_12.4/Xcode_12.4.xip" -o ~/Downloads/Xcode_12.4.xip
xip -x ~/Downloads/Xcode_12.4.xip
mv ~/Downloads/Xcode.app /Applications/
sudo xcode-select --switch /Applications/Xcode.app

echo -e "\n\n-----------------------------Instalando Nginx"
brew install nginx

echo -e "\n\n-----------------------------Configurando Nginx"
cp ../files/Makefile.nginx /usr/local/etc/nginx/Makefile
cp ../files/nginx.conf /usr/local/etc/nginx/