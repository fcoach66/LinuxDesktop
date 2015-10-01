#!/bin/bash

apt-get install -y aptitude synaptic gdebi-core software-properties-gtk rar unrar vim dos2unix gconf-editor debconf-utils ssh sssd unace p7zip-rar p7zip zip unzip sharutils uudeview mpack arj cabextract file-roller
echo "unattended-upgrades/enable_auto_updates boolean true" > /tmp/unattende-upgrades.seed
debconf-set-selections /tmp/unattended-upgrades.seed
dpkg-reconfigure unattended-upgrades -u



