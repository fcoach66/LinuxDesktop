#!/bin/bash

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
sudo apt-get -q=2 update
sudo apt-get install -y virtualbox-4.3

