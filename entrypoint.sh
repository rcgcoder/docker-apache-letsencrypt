#!/bin/bash
echo ">> copying files"
service apache2 stop
/etc/init.d/nscd stop
/etc/init.d/bind9 stop
rm -r /etc/letsencrypt
ln -s /usr/config/proxy-server/letsencrypt /etc 2> /dev/null > /dev/null 
rm -r /etc/apache2/sites-enabled
ln -s /usr/config/proxy-server/apache-config/sites-enabled /etc/apache2/sites-enabled 2> /dev/null > /dev/null 
rm -r /var/www/html
ln -s /usr/config/proxy-server/apache-contents /var/www/html 2> /dev/null > /dev/null 
rm -r /etc/bind
ln -s /usr/config/dns-server/bind/etc /etc/bind 2> /dev/null > /dev/null 
/etc/init.d/bind9 start
/etc/init.d/nscd start
service apache2 start
/etc/init.d/nscd restart
/etc/init.d/bind9 restart

echo "now no-ip client installation"


exit 0
# exec CMD
#echo ">> exec docker CMD"
#echo "$@"
#exec "$@"
