#!/bin/sh

# Uso: install.sh <realm kerberos> <dominio> <server kerberos> <amministratore dominio kerberos> <password amministratore dominio kerberos>
# Esempio: ./install.sh SINFOCOM.IT sinfocom.it server.sinfocom.it sysadmin password 


apt-get install -y -q=2 dos2unix vim ssh sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd
echo "Name: Mkhomedir" > /usr/share/pam-configs/mkhomedir
echo "Default: yes" >> /usr/share/pam-configs/mkhomedir
echo "Priority: 0" >> /usr/share/pam-configs/mkhomedir
echo "Session-Interactive-Only: yes" >> /usr/share/pam-configs/mkhomedir
echo "Session-Type: Additional" >> /usr/share/pam-configs/mkhomedir
echo "Session:" >> /usr/share/pam-configs/mkhomedir
echo "optional pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /usr/share/pam-configs/mkhomedir
echo "%Domain\ Admins@$2 ALL=(ALL) ALL" >> /etc/sudoers
pam-auth-update --profile
echo "$5" | kinit $4@$1
realm -v join $2 --user-principal=mintdom/$4@$1 --unattended

