sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y ppa:docky-core/ppa
sudo add-apt-repository -y ppa:benoitfra/google2ubuntu
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo add-apt-repository -y "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps"
sudo add-apt-repository -y "deb http://archive.getdeb.net/ubuntu trusty-getdeb games"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
sudo add-apt-repository -y ppa:mc3man/trusty-media
sudo add-apt-repository -y ppa:linrunner/tlp
wget -q -O- ftp://ftp.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
sudo add-apt-repository -y "deb ftp://ftp.videolan.org/pub/debian/stable ./"
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo add-apt-repository -y ppa:me-davidsansome/clementine
sudo add-apt-repository -y ppa:mjblenner/ppa-hal 
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:oibaf/graphics-drivers
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo add-apt-repository -y ppa:pipelight/stable
sudo add-apt-repository -y ppa:plexapp/plexht
sudo add-apt-repository -y ppa:satyajit-happy/themes
sudo add-apt-repository -y ppa:shutter/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/themes
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo add-apt-repository -y ppa:flozz/flozz
sudo add-apt-repository -y "deb http://liquorix.net/debian sid main"
sudo apt-get update
apt-get install -y --force-yes liquorix-keyring
sudo apt-get -q=2 update
sudo apt-get dist-upgrade


sudo apt-get install -y docky google2ubuntu google-chrome-stable google-talkplugin tlp libdvdcss2 simplescreenrecorder clementine hal variety pipelight plexhometheater gnome-shell-theme* numix-gtk-theme evolve-gtk-theme shutter spotify-client ubuntu-tweak oracle-java8-installer faenza-colors faenza-icon-theme faience-azur-dark faience-icon-theme mint-themes mint-themes-gtk3 mint-x-icons zukitwo-theme y-ppa-manager filezilla shotwell chromium-browser evolution amule vuze skype gnucash scribus amarok audacity rhythmbox sound-juicer gtkpod xmms2* dvdrip kino vlc xine-ui xine-plugin k3b normalize-audio sox vcdimager bluefish eclipse ttf-mscorefonts-installer gwibber virtualbox virtualbox-dkms thunderbird thunderbird-locale-it xul-ext-lightning xul-ext-gdata-provider xul-ext-calendar-timezones enigmail
