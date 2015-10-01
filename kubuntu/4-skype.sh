#!/bin/bash

sudo apt-get remove -y skype skype-bin:i386 skype:i386
sudo apt-get install -y sni-qt:i386
dpkg --add-architecture i386
apt-get update -q=2
add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
apt-get update -q=2
apt-get install -y skype




