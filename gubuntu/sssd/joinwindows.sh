apt-get -y install ssh vim sssd krb5-user libpam-sss libnss-sss sssd-tools samba-common samba-common-bin samba-libs adcli realmd 
kinit sysadmin@SINFOCOM.IT
#echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
#echo greeter-show-manual-login=true >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
#echo "%Domain\ Admins@sinfocom.it ALL=(ALL) ALL" >> /etc/sudoers
echo "Name: Mkhomedir" > /usr/share/pam-configs/mkhomedir
echo "Default: yes" >> /usr/share/pam-configs/mkhomedir
echo "Priority: 0" >> /usr/share/pam-configs/mkhomedir
echo "Session-Interactive-Only: yes" >> /usr/share/pam-configs/mkhomedir
echo "Session-Type: Additional" >> /usr/share/pam-configs/mkhomedir
echo "Session:" >> /usr/share/pam-configs/mkhomedir
echo "optional pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /usr/share/pam-configs/mkhomedir

pam-auth-update

realm -v join sinfocom.it --user-principal=mintdom/sysadmin@SINFOCOM.IT --unattended
