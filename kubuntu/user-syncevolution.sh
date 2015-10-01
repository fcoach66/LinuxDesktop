#!/bin/bash

if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
echo "Uso: installsyncevolution.sh <nome server> <email> <nome utente>"
echo "Esempio: ./install.sh mail.sinfocom.it fabrizio.cocciari@sinfocom.it fabrizio.cocciari"
exit
fi

gconftool --type string -s /apps/activesyncd/accounts/$2/username "$3"
gconftool --type string --set /apps/activesyncd/accounts/$2/serverUri https://$1/Microsoft-Server-ActiveSync
syncevolution --print-databases username=$2 backend=eas-contacts
syncevolution --configure --template none keyring=KDE backend=kde-contacts database=akonadi:?collection=2 @KDE contacts
syncevolution --configure syncURL= username=$2 backend=eas-contacts database=Contatti dumpData=0 printChanges=0 target-config@Zarafa contacts
syncevolution --configure --template none peerIsClient=1 autoSync=http syncURL=local://@Zarafa username= sync=two-way Zarafa@KDE contacts
syncevolution --sync=slow Zarafa@KDE



