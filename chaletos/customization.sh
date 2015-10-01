add-apt-repository multiverse
add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B2EC3981
add-apt-repository -y "deb https://download.01.org/syncevolution/apt stable main"
add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list' 
apt-add-repository -y ppa:pipelight/stable
add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:webupd8team/y-ppa-manager
add-apt-repository -y ppa:mjblenner/ppa-hal 
add-apt-repository -y ppa:me-davidsansome/clementine
add-apt-repository -y ppa:danielrichter2007/grub-customizer
add-apt-repository -y ppa:mc3man/mpv-tests
add-apt-repository -y ppa:nilarimogard/webupd8
sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/xUbuntu_$(lsb_release -rs)/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
cd /tmp && wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/xUbuntu_$(lsb_release -rs)/Release.key
apt-key add - < Release.key  
add-apt-repository -y ppa:vikoadi/ppa
add-apt-repository -y ppa:no1wantdthisname/ppa

sudo apt-get remove -y skype skype-bin:i386 skype:i386
dpkg --add-architecture i386
apt-get -q=2 update
apt-get install -y --force-yes aptitude synaptic gdebi-core software-properties-gtk rar unrar plasma-widget-quickaccess kscreensaver plasma-widget-homerun-kicker plasma-widget-homerun yakuake vim dos2unix gconf-editor debconf-utils ssh sssd unace p7zip-rar p7zip zip unzip sharutils uudeview mpack arj cabextract file-roller unity-greeter kde-wallpapers kdewallpapers debconf-utils dos2unix vim ssh sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd packagekit apparmor-utils syncevolution-bundle syncevolution-activesync skype dropbox chromium-browser webaccounts-chromium-extension pepperflashplugin-nonfree chromium-browser-l10n network-manager-openvpn network-manager-openconnect network-manager-openvpn network-manager-strongswan network-manager-vpnc strongswan-plugin-eap-mschapv2 strongswan-plugin-openssl thunderbird thunderbird-locale-it xul-ext-lightning xul-ext-gdata-provider xul-ext-calendar-timezones enigmail vlc* pipelight-multi pepperflashplugin-nonfree oracle-java8-installer y-ppa-manager hal clementine grub-customizer mpv youtube-viewer owncloud-client indicator-kdeconnect kdeconnect fontconfig-infinality
dpkg-divert --local --add /etc/init.d/systemd-logind
ln -s /bin/true /etc/init.d/systemd-logind

apt-get dist-upgrade -y

# vi /etc/kernel/postrm.d/zz-update-grub # Commentare if e fi
# vi /etc/kernel/postinst.d/zz-update-grub # Commentare if e fi

apt-get dist-upgrade -y

# vi /etc/kernel/postrm.d/zz-update-grub # Decommentare if e fi
# vi /etc/kernel/postinst.d/zz-update-grub # Decommentare if e fi
