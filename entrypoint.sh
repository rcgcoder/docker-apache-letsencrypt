#!/bin/bash
echo ">> copying files"
ln -s /usr/config/proxy-server/letsencrypt-live /etc/letsencrypt/live 2> /dev/null > /dev/null 
cp /usr/config/proxy-server/sites/links/* /etc/apache2/sites-available/ 2> /dev/null > /dev/null
cp /usr/config/proxy-server/sites/links/* /etc/apache2/sites-enabled/ 2> /dev/null > /dev/null 
exit 0
# exec CMD
#echo ">> exec docker CMD"
#echo "$@"
#exec "$@"
