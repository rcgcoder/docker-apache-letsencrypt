#!/bin/bash
echo ">> copying files"
service apache2 stop
rm -r /etc/letsencrypt
ln -s /usr/config/proxy-server/letsencrypt /etc 2> /dev/null > /dev/null 
rm -r /etc/apache2
ln -s /usr/config/proxy-server/apache-config /etc 2> /dev/null > /dev/null 
rm -r /var/www/html
ln -s /usr/config/proxy-server/apache-contents /var/www/html 2> /dev/null > /dev/null 

service apache2 start

exit 0
# exec CMD
#echo ">> exec docker CMD"
#echo "$@"
#exec "$@"
