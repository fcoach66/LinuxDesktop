wget -q -O- ftp://ftp.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
sudo add-apt-repository -y "deb ftp://ftp.videolan.org/pub/debian/stable ./"
sudo apt-get -q=2 update
sudo apt-get install -y libdvdcss2
