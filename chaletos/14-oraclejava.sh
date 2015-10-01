#!/bin/bash

add-apt-repository -y ppa:webupd8team/java
apt-get -q=2 update
apt-get install -y oracle-java8-installer

