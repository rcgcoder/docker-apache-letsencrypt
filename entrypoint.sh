#!/bin/bash
echo ">> copying files"
service apache2 stop
rmdir -r /etc/letsencrypt
ln -s /usr/config/proxy-server/letsencrypt /etc 2> /dev/null > /dev/null 
rmdir -r /etc/apache2
ln -s /usr/config/proxy-server/apache-config /etc 2> /dev/null > /dev/null 
service apache2 start

exit 0
# exec CMD
#echo ">> exec docker CMD"
#echo "$@"
#exec "$@"
