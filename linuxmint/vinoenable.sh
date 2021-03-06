#!/bin/sh

gsettings set org.gnome.Vino enabled true
gsettings set org.gnome.Vino view-only false
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino vnc-password "$(echo -n "password" | base64)"
