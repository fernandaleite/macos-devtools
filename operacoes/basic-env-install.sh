#!/bin/bash

echo "#########################################################"
echo "###     Instalando aplicacoes de ambiente basicas     ###"
echo "#########################################################"

echo -e "\n\n-----------------------------Criando diretório dos projetos"
mkdir ~/projetos

echo -e "\n\n-----------------------------Verificando instalação do PIP"
PIP_VERSION=$(pip --version)
if $PIP_VERSION_VERSION == "pip "; then
  sudo pip install --upgrade pip
  pip --version
else
  sudo easy_install pip
fi

echo -e "\n\n-----------------------------Instalando Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo -e "\n\n-----------------------------Habilitando SSH"
SSH_STATUS=$(sudo systemsetup -getremotelogin)
if $SSH_STATUS != "Remote Login: On"; then
  sudo systemsetup -setremotelogin on
fi

echo -e "\n\n-----------------------------Configurando SSH"

while read -p "Configurar um gerenciador de repositório? [S/n]: " GET_SVN && [[ "$GET_SVN" == "s" || "$GET_SVN" == "S" ]];
do
	read -p "Qual o host do gerenciador de repositório: " HOST_NAME
  HOST_NAME=$(echo "$HOST_NAME" | tr '[:upper:]' '[:lower:]')
  REPO_NAME=$(echo $HOST_NAME | tr "." " ")
  REPO_NAME=(${HOST_NAME//./ })
  REPO_NAME=${REPO_NAME[0]}

  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_${REPO_NAME}

  echo -e "\nAdicione sua chave SSH pública à sua conta do ${REPO_NAME}:"
  echo -e "==========================================================================\n"
  cat ~/.ssh/id_rsa_${REPO_NAME}
  echo -e "\n==========================================================================\n"

  echo -e "Salvando no SSH Config:\n"
  echo -e "# Private ${REPO_NAME} instance" >> ~/.ssh/config
  echo -e "Host ${HOST_NAME}" >> ~/.ssh/config
  echo -e "  Preferredauthentications publickey" >> ~/.ssh/config
  echo -e "  IdentityFile ~/.ssh/id_rsa_${REPO_NAME}\n" >> ~/.ssh/config
done

echo -e "\n\n-----------------------------Instalando GIT"
GIT_VERSION=$(git --version)
if $GIT_VERSION != "git version "; then
  brew install git
fi

echo -e "-----------------------------Configurando GIT"
read -p "Entre com o git name: " GIT_NAME
read -p "Entre com o git email: " GIT_EMAIL
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL

echo -e "\n\n-----------------------------Instalando HTTPie"
brew install httpie

echo -e "\n\n-----------------------------Instalando Redis CLI"
brew install redis

echo -e "\n\nLocation of Redis configuration file -> /usr/local/etc/redis.conf"
redis-cli -v

echo -e "\n\n-----------------------------Instalando AWS CLI"
curl -fsSL "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o ~/Downloads/awscli-bundle.zip
unzip ~/Downloads/awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
aws --version

echo -e "\n\n-----------------------------Configurando credenciais AWS"
aws configure

echo -e "\n\n-----------------------------Instalando ASDF"
brew install asdf

echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc
echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> ~/.zshrc
echo "legacy_version_file = yes" > ~/.asdfrc

echo -e "\n\n-----------------------------Instalando Htop"
brew install htop

echo -e "\n\n-----------------------------Instalando CTOP"
brew install ctop

echo -e "\n\n-----------------------------Verificando instalação do xcode select"
XCODE_SELECT_VERSION=$(xcode-select -version)
if $XCODE_SELECT_VERSION != "xcode-select version"; then
  xcode-select --install
fi
