sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
apt-get -q=2 update
apt-get install -y filezilla shotwell chromium-browser evolution amule vuze skype gnucash scribus amarok audacity rhythmbox sound-juicer gtkpod xmms2* dvdrip kino vlc xine-ui xine-plugin k3b normalize-audio sox vcdimager bluefish eclipse ttf-mscorefonts-installer gwibber virtualbox virtualbox-dkms
#add-apt-repository "deb http://archive.canonical.com/ precise partner"
#apt-get -y update
#apt-get -y install acroread
apt-get install -y thunderbird thunderbird-locale-it xul-ext-lightning xul-ext-gdata-provider xul-ext-calendar-timezones enigmail

# Broadcom Wireless Driver
apt-get install bcmwl-kernel-source


