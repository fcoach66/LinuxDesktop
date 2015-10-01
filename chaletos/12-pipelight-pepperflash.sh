#!/bin/bash

apt-add-repository -y ppa:pipelight/stable
apt-get -q=2 update
apt-get install -y pipelight-multi
apt-get install -y pepperflashplugin-nonfree
pipelight-plugin --enable silverlight
update-pepperflashplugin-nonfree --install


