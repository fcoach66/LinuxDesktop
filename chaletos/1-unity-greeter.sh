#!/bin/bash

apt-get install -y unity-greeter

echo "[SeatDefaults]" > /etc/lightdm/lightdm.conf
echo "greeter-show-manual-login=true" >> /etc/lightdm/lightdm.conf
echo "greeter-hide-users=true" >> /etc/lightdm/lightdm.conf
echo "greeter-session=unity-greeter" >> /etc/lightdm/lightdm.conf
echo "allow-guest=false" >> /etc/lightdm/lightdm.conf


echo "[com.canonical.unity-greeter]" > /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "background-color='#00B6BD'" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "background='/usr/share/wallpapers/kde-default.png'" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "draw-user-backgrounds=false" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "draw-grid=false" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "logo='/usr/share/unity-greeter/logo.png'" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#background-logo=''" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "theme-name='Ambiance'" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#icon-theme-name=" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#font-name=" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#xft-antialias" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#xft-dpi" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#xft-hintstyle=" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#xft-rgba=" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#onscreen-keyboard=false" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#high-contrast=false" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "#screen-reader=false" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
echo "play-ready-sound=false" >> /usr/share/glib-2.0/schemas/20_sinfocom-unity-greeter.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas/
sed -i "s|XftHintStyle=hintmedium|XftHintStyle=hintfull|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|font=Ubuntu,9,-1,5,50,0,0,0,0,0|desktopFont=Droid Sans,9,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|menuFont=Ubuntu,9,-1,5,50,0,0,0,0,0|fixed=Droid Sans Mono,9,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|desktopFont=Ubuntu,9,-1,5,50,0,0,0,0,0|font=Droid Sans,9,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|toolBarFont=Ubuntu,8,-1,5,50,0,0,0,0,0|menuFont=Droid Sans,9,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|smallestReadableFont=Ubuntu,8,-1,5,50,0,0,0,0,0|smallestReadableFont=Droid Sans,8,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|taskbarFont=Ubuntu,9,-1,5,50,0,0,0,0,0|taskbarFont=Droid Sans,9,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "s|activeFont=Ubuntu,9,-1,5,50,0,0,0,0,0|toolBarFont=Droid Sans,8,-1,5,50,0,0,0,0,0|g" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals
sed -i "/XftHintStyle=hintfull/aXftSubPixel=rgb" /usr/share/kubuntu-default-settings/kde4-profile/default/share/config/kdeglobals

