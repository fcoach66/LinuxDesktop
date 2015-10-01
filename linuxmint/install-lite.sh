sed -i '/\[daemon\]/aSelectLastLogin=false' /etc/mdm/mdm.conf
sed -i '/\[greeter\]/aGraphicalTheme=Simple UserList' /etc/mdm/mdm.conf


apt-get -q=2 update
apt-get -y dist-upgrade
apt-get install -y vim filezilla shotwell chromium-browser webaccounts-chromium-extension unity-chromium-extension pepperflashplugin-nonfree chromium-browser-l10n picasa evolution evolution-ews evolution-mapi mail-notification-evolution fetchyahoo getlive syncevolution skype sni-qt:i386 google-earth-stable scribus liblcms-utils tcl8.6 tk8.6 tix python-tk-dbg scribus-template icc-profiles icc-profiles-free audacity rhythmbox rhythmbox-mozilla rhythmbox-plugins rhythmbox-plugin-cdrecorder rhythmbox-plugin-zeitgeist sound-juicer libdiscid0-dbg gstreamer0.10-plugins-* gtkpod id3v2 python-mutagen vorbis-tools anjuta faad lame mp3gain xmms2* dvdrip xine-ui subtitleripper dvdrip-doc libmagickcore5-extra netpbm libasync-interrupt-perl libguard-perl transcode-doc twolame kino vlc* xine-ui xine-plugin normalize-audio mpg321 flac libaudio-scrobbler-perl sox vcdimager bluefish ttf-mscorefonts-installer gwibber friends-* thunderbird thunderbird-locale-it xul-ext-lightning xul-ext-gdata-provider xul-ext-calendar-timezones enigmail
#add-apt-repository "deb http://archive.canonical.com/ precise partner"
#apt-get -y update
#apt-get -y install acroread

# Broadcom Wireless Driver
# apt-get install bcmwl-kernel-source

# Calendar Indicator
sudo add-apt-repository -y ppa:atareao/atareao
sudo apt-get -q=2 update
sudo apt-get install -y calendar-indicator

# Pidgin Indicator
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get -q=2 update
sudo apt-get install -y pidgin-indicator

# Weather Indicator
sudo apt-get install -y my-weather-indicator

# Variety
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo apt-get -q=2 update
sudo apt-get install -y variety

# Gstreamer ffmpeg
sudo add-apt-repository -y ppa:mc3man/trusty-media
sudo apt-get -q=2 update
sudo apt-get install -y gstreamer0.10-ffmpeg

# Pipelight
sudo apt-add-repository -y ppa:pipelight/stable
sudo apt-get -q=2 update
sudo apt-get install -y pipelight-multi
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --enable widevine

update-pepperflashplugin-nonfree --install

apt-get install -y libreoffice-style-sifr

# Nvidia
sudo apt-get purge -y bumblebee*
sudo apt-get install -y nvidia-prime
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get -q=2 update
sudo apt-get install -y prime-indicator

# Tlp
add-apt-repository -y ppa:linrunner/tlp
apt-get -q=2 update
apt-get install -y tlp tlp-rdw
tlp start

apt-get install -y ubuntu-restricted-extras
apt-get install -y libavcodec-extra

# Java 8 Oracle
add-apt-repository -y ppa:webupd8team/java
apt-get -q=2 update
apt-get install -y oracle-java8-installer

# Libdvdread64
apt-get install -y libdvdread4
/usr/share/doc/libdvdread4/install-css.sh

# Jayatana
add-apt-repository -y ppa:danjaredg/jayatana
sudo apt-get -q=2 update
apt-get install -y jayatana

# Google2ubuntu
sudo add-apt-repository -y ppa:benoitfra/google2ubuntu
sudo apt-get -q=2 update
sudo apt-get install -y google2ubuntu

# Simplescreenrecorder
# http://www.maartenbaert.be/simplescreenrecorder/
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo apt-get -q=2 update
apt-get install -y simplescreenrecorder

# Clementine
sudo add-apt-repository -y ppa:me-davidsansome/clementine
sudo apt-get -q=2 update
apt-get install -y clementine

# Hal
sudo add-apt-repository -y ppa:mjblenner/ppa-hal 
sudo apt-get -q=2 update
apt-get install -y hal

# Plex Home Teather
# https://launchpad.net/~plexapp/+archive/ubuntu/plexht
sudo add-apt-repository -y ppa:plexapp/plexht
sudo apt-get -q=2 update
sudo apt-get install -y plexhometheater

# Shutter
# https://launchpad.net/~shutter/+archive/ubuntu/ppa
sudo add-apt-repository -y ppa:shutter/ppa
sudo apt-get -q=2 update
sudo apt-get install -y shutter

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-get -q=2 update
sudo apt-get install -y spotify-client

# Y ppa manager
# https://launchpad.net/~webupd8team/+archive/ubuntu/y-ppa-manager
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
sudo apt-get -q=2 update
sudo apt-get install -y y-ppa-manager

# Virtualbox
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
sudo apt-get -q=2 update
sudo apt-get install virtualbox-4.3

# Cairo Dock
sudo add-apt-repository ppa:cairo-dock-team/ppa 
sudo apt-get update 
sudo apt-get install cairo-dock cairo-dock-plug-ins












