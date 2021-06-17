#!/bin/bash

echo -e "\n\n-----------------------------Configurando aliases"

echo -e "alias zshedit='vim ~/.zshrc'" >> ~/.zshrc
echo -e "alias zshclean='source ~/.zshrc'" >> ~/.zshrc

echo -e "alias hosts-edit='sudo vim /etc/hosts'" >> ~/.zshrc
echo -e "alias hosts-clean='sudo killall -HUP mDNSResponder; sleep 2;'" >> ~/.zshrc

echo -e "alias nginxedit='vim /usr/local/etc/nginx/nginx.conf'" >> ~/.zshrc

echo -e "alias show-ports='lsof -i | grep LISTEN'" >> ~/.zshrc
echo -e "alias gr='grep -r ${1} ~/projetos/'" >> ~/.zshrc
echo -e "alias lsa='ls -la'" >> ~/.zshrc
echo -e "alias scan=\"ls | xargs -I % sh -c 'echo %; git -C % status; echo ----------'\"" >> ~/.zshrc

echo -e "alias projetos='cd ~/projetos/'" >> ~/.zshrc

source ~/.zshrc

