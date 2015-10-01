# http://www.getdeb.net/updates/ubuntu/14.04/
# http://www.playdeb.net/updates/Ubuntu/14.04
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo add-apt-repository -y "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps"
sudo add-apt-repository -y "deb http://archive.getdeb.net/ubuntu trusty-getdeb games"
sudo apt-get -q=2 update

