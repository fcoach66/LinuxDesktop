wget -O - http://repo.pbis.beyondtrust.com/yum/RPM-GPG-KEY-pbis|sudo apt-key add - 
sudo wget -O /etc/apt/sources.list.d/pbiso.list http://repo.pbis.beyondtrust.com/apt/pbiso.list 
sudo apt-get -q=2 update