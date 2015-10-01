#!/bin/bash

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_$(lsb_release -rs)/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
cd /tmp && wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_$(lsb_release -rs)/Release.key
sudo apt-key add - < Release.key  
sudo apt-get update
sudo apt-get install -y owncloud-client