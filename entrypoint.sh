#!/bin/bash
mkdir -p /etc/letsencrypt/live 
cp /usr/config/proxy-server/certs/letsencrypt/live/* /etc/letsencrypt/live/ 2> /dev/null > /dev/null 
cp /usr/config/proxy-server/apache-config/sites-available/* /etc/apache2/sites-available/ 2> /dev/null > /dev/null
cp /usr/config/proxy-server/apache-config/sites-available/* /etc/apache2/sites-enabled/ 2> /dev/null > /dev/null 

# exec CMD
echo ">> exec docker CMD"
echo "$@"
exec "$@"
