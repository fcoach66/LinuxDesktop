#!/bin/sh

# Uso: install.sh <realm kerberos> <server kerberos> <amministratore dominio kerberos> <password amministratore dominio kerberos>

set -e
sed -i '/\[daemon\]/aSelectLastLogin=false' /etc/mdm/mdm.conf
sed -i '/\[daemon\]/aGreeter=/usr/lib/mdm/mdmgreeter' /etc/mdm/mdm.conf
sed -i '/\[greeter\]/aGraphicalTheme=Arc-Brave' /etc/mdm/mdm.conf
mdmflexiserver --command="UPDATE_CONFIG daemon/DisplayLastLogin=false"
mdmflexiserver --command="UPDATE_CONFIG daemon/Greeter=/usr/lib/mdm/mdmgreeter"
mdmflexiserver --command="UPDATE_CONFIG greeter/GraphicalTheme=Arc-Brave"

echo "krb5-config krb5-config/default_realm string $1" > /tmp/krb5-config.seed
echo "krb5-config krb5-config/add_servers_realm string $1" >> /tmp/krb5-config.seed
echo "krb5-config	krb5-config/kerberos_servers	string  $2" >> /tmp/krb5-config.seed
echo "krb5-config krb5-config/admin_server string $2" >> /tmp/krb5-config.seed
echo "krb5-config krb5-config/add_servers boolean true" >> /tmp/krb5-config.seed
echo "krb5-config krb5-config/read_conf	boolean	true" >> /tmp/krb5-config.seed

sudo apt-get install -y -q=2 debconf-utils
debconf-set-selections /tmp/krb5-config.seed

apt-get -q=2 update
apt-get install -y -q=2 vim ssh sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd

echo "$4" | kinit $3
echo "Name: Mkhomedir" > /usr/share/pam-configs/mkhomedir
echo "Default: yes" >> /usr/share/pam-configs/mkhomedir
echo "Priority: 0" >> /usr/share/pam-configs/mkhomedir
echo "Session-Interactive-Only: yes" >> /usr/share/pam-configs/mkhomedir
echo "Session-Type: Additional" >> /usr/share/pam-configs/mkhomedir
echo "Session:" >> /usr/share/pam-configs/mkhomedir
echo "optional pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /usr/share/pam-configs/mkhomedir
echo "%Domain\ Admins@$1 ALL=(ALL) ALL" >> /etc/sudoers
pam-auth-update --profile
realm -v join $1 --user-principal=mintdom/sysadmin@$1 --unattended
