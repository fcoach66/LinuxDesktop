#!/bin/bash

if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" || -z "$6" ]]; then
echo "Uso: install.sh <realm kerberos> <dominio> <server kerberos> <amministratore dominio kerberos> <password amministratore dominio kerberos> <nome computer>"
echo "Esempio: ./install.sh SINFOCOM.IT sinfocom.it server.sinfocom.it sysadmin password computerdesktop"
exit
fi

set -e
sed -i '/\[daemon\]/aSelectLastLogin=false' /etc/mdm/mdm.conf
sed -i '/\[daemon\]/aGreeter=/usr/lib/mdm/mdmgreeter' /etc/mdm/mdm.conf
sed -i '/\[greeter\]/aGraphicalTheme=Arc-Brave' /etc/mdm/mdm.conf
mdmflexiserver --command="UPDATE_CONFIG daemon/DisplayLastLogin=false"
mdmflexiserver --command="UPDATE_CONFIG daemon/Greeter=/usr/lib/mdm/mdmgreeter"
mdmflexiserver --command="UPDATE_CONFIG greeter/GraphicalTheme=Arc-Brave"

echo "krb5-config krb5-config/default_realm string $1" > /tmp/krb5-config.seed
echo "krb5-config krb5-config/add_servers_realm string $1" >> /tmp/krb5-config.seed
echo "krb5-config	krb5-config/kerberos_servers	string  $3" >> /tmp/krb5-config.seed
echo "krb5-config krb5-config/admin_server string $3" >> /tmp/krb5-config.seed
echo "krb5-config krb5-config/add_servers boolean true" >> /tmp/krb5-config.seed
echo "krb5-config krb5-config/read_conf	boolean	true" >> /tmp/krb5-config.seed

echo "ttf-mscorefonts-installer       msttcorefonts/dlurl     string" > /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/accepted-mscorefonts-eula boolean true" >> /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/savedir   string" >> /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/present-mscorefonts-eula  note" >> /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/http_proxy        string" >> /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/baddldir  error" >> /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/dldir     string" >> /tmp/ttf-mscorefonts-installer.seed
echo "ttf-mscorefonts-installer       msttcorefonts/error-mscorefonts-eula    error" >> /tmp/ttf-mscorefonts-installer.seed

echo "oracle-java8-installer shared/present-oracle-license-v1-1	note" > /tmp/oracle-java8-installer.seed
echo "oracle-java8-installer oracle-java7-installer/local string" >> /tmp/oracle-java8-installer.seed
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" >> /tmp/oracle-java8-installer.seed

sudo apt-get install -y -q=2 debconf-utils
debconf-set-selections /tmp/krb5-config.seed
debconf-set-selections /tmp/ttf-mscorefonts-installer.seed
debconf-set-selections /tmp/oracle-java8-installer.seed
add-apt-repository -y ppa:atareao/atareao
add-apt-repository -y ppa:nilarimogard/webupd8
add-apt-repository -y ppa:peterlevi/ppa
add-apt-repository -y ppa:mc3man/trusty-media
apt-add-repository -y ppa:pipelight/stable
add-apt-repository -y ppa:linrunner/tlp
add-apt-repository -y ppa:nilarimogard/webupd8
add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:danjaredg/jayatana
add-apt-repository -y ppa:benoitfra/google2ubuntu
add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
add-apt-repository -y ppa:me-davidsansome/clementine
add-apt-repository -y ppa:mjblenner/ppa-hal 
add-apt-repository -y ppa:plexapp/plexht
add-apt-repository -y ppa:shutter/ppa
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
add-apt-repository -y "deb http://repository.spotify.com stable non-free"
add-apt-repository -y ppa:webupd8team/y-ppa-manager
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
add-apt-repository -y "deb http://download.virtualbox.org/virtualbox/debian trusty contrib"
add-apt-repository -y ppa:cairo-dock-team/ppa 
add-apt-repository -y ppa:danielrichter2007/grub-customizer
apt-get -q=2 update
apt-get install -y -q=2 dos2unix vim ssh sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd

echo "$5" | kinit $4@$1
echo "Name: Mkhomedir" > /usr/share/pam-configs/mkhomedir
echo "Default: yes" >> /usr/share/pam-configs/mkhomedir
echo "Priority: 0" >> /usr/share/pam-configs/mkhomedir
echo "Session-Interactive-Only: yes" >> /usr/share/pam-configs/mkhomedir
echo "Session-Type: Additional" >> /usr/share/pam-configs/mkhomedir
echo "Session:" >> /usr/share/pam-configs/mkhomedir
echo "optional pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /usr/share/pam-configs/mkhomedir
echo "%Domain\ Admins@$2 ALL=(ALL) ALL" >> /etc/sudoers
pam-auth-update --profile
realm -v join $2 --user-principal=$6/$4@$1 --unattended

apt-get purge -y transmission*

# File archiving
apt-get install -y unace rar unrar p7zip-rar p7zip zip unzip sharutils uudeview mpack arj cabextract file-roller

# Evolution Mail client
apt-get install -y evolution evolution-ews evolution-mapi
apt-get install -y mail-notification-evolution

# Thunderbird Mail client
apt-get install -y thunderbird thunderbird-locale-it xul-ext-lightning xul-ext-gdata-provider xul-ext-calendar-timezones enigmail ttf-lyx

# FTP Client
apt-get install -y filezilla

# Chromium Web Browser
apt-get install -y chromium-browser webaccounts-chromium-extension pepperflashplugin-nonfree chromium-browser-l10n
update-pepperflashplugin-nonfree --install

# Skype
apt-get install -y skype sni-qt:i386

# Libreoffice Addons
apt-get install -y libreoffice-base browser-plugin-libreoffice libreoffice-mysql-connector libreoffice-sdbc-postgresql openclipart-libreoffice openclipart2-libreoffice libreoffice-avmedia-backend-gstreamer libreoffice-dmaths libreoffice-templates libreoffice-wiki-publisher libreoffice-style-sifr

# Gimp Addons
apt-get install -y gimp-plugin-registry gimp-gmic icc-profiles glew-utils libtiff-opengl gimp-data-extras gimp-gap gimp-texturize gimp-ufraw ufraw pandora gimp-lensfun gimp-gutenprint gimp-dds gimp-flegita gutenprint-doc gutenprint-locales

# Scribus
apt-get install -y scribus scribus-template icc-profiles icc-profiles-free

# Pencil
apt-get install -y pencil

# Google Earth
apt-get install -y google-earth-stable 

# Rhythmbox
apt-get install -y rhythmbox rhythmbox-mozilla rhythmbox-plugins rhythmbox-plugin-cdrecorder rhythmbox-plugin-zeitgeist

# Oracle Java 8
apt-get install -y oracle-java8-installer

# apt-get install -y sound-juicer libdiscid0-dbg gstreamer0.10-plugins-* gtkpod id3v2 python-mutagen vorbis-tools anjuta faad lame mp3gain xmms2* dvdrip xine-ui subtitleripper dvdrip-doc libmagickcore5-extra netpbm libasync-interrupt-perl libguard-perl transcode-doc twolame kino vlc* xine-ui xine-plugin normalize-audio mpg321 flac libaudio-scrobbler-perl sox vcdimager bluefish  gwibber friends-*

# Google Calendar Indicator
apt-get install -y calendar-indicator

# Pidgin Indicator
apt-get install -y pidgin-indicator

# My Weather Indicator
apt-get install -y my-weather-indicator

# Microsoft ttf core fonts
apt-get install -y ttf-mscorefonts-installer

# Pipelight
apt-get install -y pipelight-multi
pipelight-plugin -y --enable silverlight

# Tlp
apt-get install -y tlp tlp-rdw
tlp start

# Restricted Codecs
apt-get install -y ubuntu-restricted-extras
apt-get install -y libavcodec-extra
apt-get install -y libdvdread4
apt-get install -y gstreamer0.10-ffmpeg
/usr/share/doc/libdvdread4/install-css.sh

# Y ppa manager
apt-get install -y y-ppa-manager

# Grub customizer
apt-get install -y grub-customizer

# Variety
apt-get install -y variety

# Hal
apt-get install -y hal

# Google2ubuntu
apt-get install -y google2ubuntu

# Jayatana
apt-get install -y jayatana

# Virtualbox 4.3
apt-get install -y virtualbox-4.3

# Cairo Dock
apt-get install -y cairo-dock cairo-dock-plug-ins

# Shotwell
apt-get install -y shotwell

# Audacity
apt-get install -y audacity

# Picasa
apt-get install -y picasa

# Friends
apt-get install -y friends-*

# Playonlinux
apt-get install -y playonlinux


# apt-get install -y simplescreenrecorder
# apt-get install -y clementine
# apt-get install -y plexhometheater
# apt-get install -y spotify-client
# apt-get install -y shutter

apt-get -y dist-upgrade
reboot


#add-apt-repository "deb http://archive.canonical.com/ precise partner"
#apt-get -y update
#apt-get -y install acroread

# Broadcom Wireless Driver
# apt-get install bcmwl-kernel-source


# Nvidia
#sudo apt-get purge -y bumblebee*
#sudo apt-get install -y nvidia-prime
#sudo apt-get -q=2 update
#sudo apt-get install -y prime-indicator

