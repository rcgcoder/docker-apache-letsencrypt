#!/bin/bash
echo ">> copying files"
rmdir -r /etc/letsencrypt
ln -s /usr/config/proxy-server/letsencrypt /etc/letsencrypt 2> /dev/null > /dev/null 
rmdir -r /etc/apache2
ln -s /usr/config/proxy-server/apache-config /etc/apache2 2> /dev/null > /dev/null 
service apache2 stop
service apache2 start

exit 0
# exec CMD
#echo ">> exec docker CMD"
#echo "$@"
#exec "$@"
