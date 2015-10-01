#!/bin/bash

if [[ -z "$1" || -z "$2" || -z "$3" || -z "$4" || -z "$5" || -z "$6" || -z "$7" ]]; then
echo "Uso: install.sh <realm kerberos> <dominio> <server kerberos> <amministratore dominio kerberos> <password amministratore dominio kerberos> <nome computer> <gruppo windows>"
echo "Esempio: ./install.sh SINFOCOM.IT sinfocom.it server.sinfocom.it sysadmin password computerdesktop SINFOCOM"
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
sudo apt-get install -y -q=2 debconf-utils
debconf-set-selections /tmp/krb5-config.seed

add-apt-repository -y ppa:gnome3-team/gnome3
apt-get -q=2 update

apt-get install -y -q=2 dos2unix vim ssh sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd
killall aptd
apt-get install -y -q=2 packagekit

killall aptd
apt-get install -y -q=2 packagekit

echo "127.0.0.1	$1.$2 $1 localhost" > /etc/hosts
echo "127.0.1.1	$1" >> /etc/hosts
echo "::1     ip6-localhost ip6-loopback" >> /etc/hosts
echo "fe00::0 ip6-localnet" >> /etc/hosts
echo "ff00::0 ip6-mcastprefix" >> /etc/hosts
echo "ff02::1 ip6-allnodes" >> /etc/hosts
echo "ff02::2 ip6-allrouters" >> /etc/hosts

echo "Name: Mkhomedir" > /usr/share/pam-configs/mkhomedir
echo "Default: yes" >> /usr/share/pam-configs/mkhomedir
echo "Priority: 0" >> /usr/share/pam-configs/mkhomedir
echo "Session-Interactive-Only: yes" >> /usr/share/pam-configs/mkhomedir
echo "Session-Type: Additional" >> /usr/share/pam-configs/mkhomedir
echo "Session:" >> /usr/share/pam-configs/mkhomedir
echo "optional pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /usr/share/pam-configs/mkhomedir
echo "%Domain\ Admins@$2 ALL=(ALL) ALL" >> /etc/sudoers
pam-auth-update --profile
echo "$5" | realm -v join $2 -U $4

mv /etc/samba/smb.conf /etc/samba/smb.conf.orig
echo "[global]" > /etc/samba/smb.conf
echo "workgroup = $7" >> /etc/samba/smb.conf
echo "realm = $1" >> /etc/samba/smb.conf
echo "kerberos method = system keytab" >> /etc/samba/smb.conf
echo "security = ads" >> /etc/samba/smb.conf
echo "server string = %h server" >> /etc/samba/smb.conf
echo "dns proxy = no" >> /etc/samba/smb.conf
echo "log file = /var/log/samba/log.%m" >> /etc/samba/smb.conf
echo "max log size = 1000" >> /etc/samba/smb.conf
echo "syslog = 0" >> /etc/samba/smb.conf
echo "panic action = /usr/share/samba/panic-action %d" >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf
echo "[printers]" >> /etc/samba/smb.conf
echo "comment = All Printers" >> /etc/samba/smb.conf
echo "browseable = no" >> /etc/samba/smb.conf
echo "path = /var/spool/samba" >> /etc/samba/smb.conf
echo "printable = yes" >> /etc/samba/smb.conf
echo "guest ok = no" >> /etc/samba/smb.conf
echo "read only = yes" >> /etc/samba/smb.conf
echo "create mask = 0700" >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf
echo "[print$]" >> /etc/samba/smb.conf
echo "comment = Printer Drivers" >> /etc/samba/smb.conf
echo "path = /var/lib/samba/printers" >> /etc/samba/smb.conf
echo "browseable = yes" >> /etc/samba/smb.conf
echo "read only = yes" >> /etc/samba/smb.conf
echo "guest ok = no" >> /etc/samba/smb.conf

apt-get -y dist-upgrade
reboot

