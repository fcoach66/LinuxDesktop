# http://liquorix.net/
sudo add-apt-repository -y "deb http://liquorix.net/debian sid main"
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/ppa
sudo apt-get update
apt-get install -y --force-yes liquorix-keyring
apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
