#!/bin/bash

echo "###########################################"
echo "###     Instalando Aplicacoes de Dev    ###"
echo "###########################################"

echo -e "\n\n-----------------------------Verificando instalação do Python 2"
PYTHON_VERSION=$(python --version)
if $PYTHON_VERSION != "Python 2"; then
  brew install python
fi

echo -e "\n\n-----------------------------Instalando Python 3"
brew install python3

echo -e "\n\n-----------------------------Instalando Go Lang"

brew install coreutils
asdf plugin-add golang
asdf install golang latest
asdf global golang $(ls /$HOME/.asdf/installs/golang)

mkdir -R ~/gocode
mkdir -R ~/gocode/bin
mkdir -R ~/gocode/pkg
mkdir -R ~/gocode/src

echo 'export GOROOT="/usr/local/go"' >> ~/.zshrc
echo 'export GOPATH=$HOME/gocode' >> ~/.zshrc
echo 'export PATH="$GOPATH/bin:$PATH"' >> ~/.zshrc
echo 'export GO111MODULE="on"' >> ~/.zshrc

echo -e "\n\n-----------------------------Instalando Java"

asdf plugin-add java https://github.com/halcyon/asdf-java.git

asdf install java adopt-openjdk-8u212-b03
asdf global java adopt-openjdk-8u212-b03

. ~/.asdf/plugins/java/set-java-home.sh

# opcao caso nao queira usar esse: brew tap AdoptOpenJDK/openjdk && brew cask install adoptopenjdk8

echo -e "\n\n-----------------------------Instalando Maven"

asdf plugin-add maven
asdf install maven latest
asdf global maven $(ls /$HOME/.asdf/installs/maven)

echo -e "\n\n-----------------------------Instalando Node JS"

brew install coreutils gpg

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs latest
asdf global nodejs $(ls /$HOME/.asdf/installs/nodejs)

echo -e "\n\n-----------------------------Instalando Yarn JS"

asdf plugin-add yarn
asdf install yarn latest
asdf global yarn $(ls /$HOME/.asdf/installs/yarn)

echo -e "\n\n-----------------------------Instalando Terraform na versão 0.11.14"

asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
asdf install terraform 0.11.14
asdf global terraform 0.11.14

echo -e "\n\n-----------------------------Instalando Gradle"

asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
asdf install gradle latest
asdf global gradle $(ls /$HOME/.asdf/installs/gradle)

echo -e "\n\n-----------------------------Instalando Kotlin"

asdf plugin-add kotlin https://github.com/missingcharacter/asdf-kotlin.git
asdf install kotlin latest
asdf global kotlin $(ls /$HOME/.asdf/installs/kotlin)

echo -e "\n\n-----------------------------Finalizado Configurações do ASDF"
echo -e "-----------------------------Plugins adicionados:"
asdf current

echo -e "\n\n-----------------------------Instalando Ruby"
brew install rbenv ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
rbenv install 2.7.2
rbenv global 2.7.2
rbenv rehash

ruby -v

echo -e "\n\n-----------------------------Instalando Lerna"
npm install --global lerna

echo -e "\n\n-----------------------------Instalando Packer"
brew install packer

echo -e "\n\n-----------------------------Instalando Watchman"
brew install watchman

echo -e "\n\n-----------------------------Instalando React Native CLI"
brew install react-native-cli

echo -e "\n\n-----------------------------Instalando Serverless"
curl -o- -L https://slss.io/install | bash