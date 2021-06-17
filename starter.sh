#!/bin/bash

echo "#######################################"
echo "###   INICIANDO CONFIG PARA MACOS   ###"
echo "#######################################"

echo -e "\n\n-----------------------------Iniciando instalaçoes"
echo -e "\n\n-----------------------------Ajustando permissoes de scripts"
sudo chmod -R +x operacoes/

echo "###########################"
echo "###  Aplicando scripts  ###"
echo "###########################"

sh operacoes/basic-env-install.sh
sh operacoes/oh-my-zsh-install.sh
sh operacoes/dev-env-install.sh
sh operacoes/tool-env-install.sh
sh operacoes/aliases.sh

echo ""
echo "#####################"
echo "###  Finalizando  ###"
echo "#####################"
echo ""
echo "O sistema precisa ser reiniciado..."
read -p "Reiniciar maquina agora? [S/n]: " SURE
SURE=${SURE:-S}
if [[ "$SURE" == "s" || "$SURE" == "S" ]]; then
	echo -e "\n\nReiniciando..................."
	sudo shutdown -r 0
else
	echo -e "\n\nSuave na nave.."
fi