apt-get -y install ssh vim sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd 
kinit sysadmin@SINFOCOM.IT
echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
echo greeter-show-manual-login=true >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
echo "%Domain\ Admins@sinfocom.it ALL=(ALL) ALL" >> /etc/sudoers
cp mkhomedir /usr/share/pam-configs/
pam-auth-update

realm -v join sinfocom.it --user-principal=mintdom/sysadmin@SINFOCOM.IT --unattended
