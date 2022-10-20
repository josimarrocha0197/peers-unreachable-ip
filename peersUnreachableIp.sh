#/bin/bash
# Script: imprime o IP de cada peer que ficou com o status de "unreachable"

logDir="/var/log/asterisk/messages"

for ramal in $(grep -i unreach ${logDir} | awk -F "'" '{ print $2 }')
do
        echo Ramal ${ramal}
        asterisk -rx 'sip show peers' | grep ${ramal}
        echo -e "\n"
done
