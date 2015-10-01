
#echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
#echo greeter-show-manual-login=true >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
#echo "%Domain\ Admins@sinfocom.it ALL=(ALL) ALL" >> /etc/sudoers

echo "$4" | kinit $3
echo "Name: Mkhomedir" > /usr/share/pam-configs/mkhomedir
echo "Default: yes" >> /usr/share/pam-configs/mkhomedir
echo "Priority: 0" >> /usr/share/pam-configs/mkhomedir
echo "Session-Interactive-Only: yes" >> /usr/share/pam-configs/mkhomedir
echo "Session-Type: Additional" >> /usr/share/pam-configs/mkhomedir
echo "Session:" >> /usr/share/pam-configs/mkhomedir
echo "optional pam_mkhomedir.so umask=0022 skel=/etc/skel" >> /usr/share/pam-configs/mkhomedir
# pam-auth-update
realm -v join $1 --user-principal=mintdom/sysadmin@$1 --unattended
