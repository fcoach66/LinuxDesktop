#!/bin/bash

apt-get install -y apparmor-utils

aa-complain usr.sbin.mysqld-akonadi
/etc/init.d/apparmor reload

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B2EC3981
add-apt-repository -y "deb https://download.01.org/syncevolution/apt stable main"
apt-get -q=2 update
apt-get install -y --force-yes syncevolution-bundle syncevolution-activesync


