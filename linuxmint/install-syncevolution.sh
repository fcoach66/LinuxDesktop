#!/bin/bash

if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
echo "Uso: installsyncevolution.sh <nome server> <email> <nome utente>"
echo "Esempio: ./install.sh mail.sinfocom.it fabrizio.cocciari@sinfocom.it fabrizio.cocciari"
exit
fi

gconftool --type string -s /apps/activesyncd/accounts/$2/username "$3"
gconftool --type string --set /apps/activesyncd/accounts/fabrizio.cocciari@sinfocom.it/serverUri https://$1/Microsoft-Server-ActiveSync
syncevolution --print-databases username=$2 backend=eas-contacts
syncevolution --configure --template none keyring=GNOME backend=evolution-contacts database=Personale @Evolution contacts
syncevolution --configure syncURL= username=$2 backend=eas-contacts database=Contatti dumpData=0 printChanges=0 target-config@Work contacts
syncevolution --configure --template none peerIsClient=1 syncURL=local://@Work username= sync=two-way Work@Evolution contacts
syncevolution --sync=slow Work@Evolution



