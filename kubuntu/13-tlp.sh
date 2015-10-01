#!/bin/bash

apt-get purge laptop-mode-tools
add-apt-repository -y ppa:linrunner/tlp
apt-get -q=2 update
apt-get install -y tlp tlp-rdw
apt-get install smartmontools ethtool
tlp start


