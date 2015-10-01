#!/bin/bash

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list' 
sudo apt-get update -q=2
sudo apt-get install -y dropbox 



