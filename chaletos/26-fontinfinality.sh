#!/bin/bash

sudo add-apt-repository -y ppa:no1wantdthisname/ppa
sudo apt-get -q=2 update
sudo apt-get -y upgrade
sudo apt-get install -y fontconfig-infinality
bash /etc/fonts/infinality/infctl.sh setstyle win7
sed -i "s|USE_STYLE=\"DEFAULT\"|USE_STYLE=\"WINDOWS7\"|g" /etc/profile.d/infinality-settings.sh