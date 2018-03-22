#!/bin/bash


if [ ! -z ${HSTS_HEADERS_ENABLE+x} ]
then
RUN ln -s /usr/config/proxy-server/certs/letsencrypt/live /etc/letsencrypt && \
	ln -s /usr/config/proxy-server/apache-config/sites-available/cantabrana.no-ip.org-le-ssl.conf /etc/apache2/sites-available/cantabrana.no-ip.org-le-ssl.conf && \
	ln -s /usr/config/proxy-server/apache-config/sites-available/cantabrana.no-ip.org.conf /etc/apache2/sites-available/cantabrana.no-ip.org.conf && \
	ln -s /usr/config/proxy-server/apache-config/sites-enabled/cantabrana.no-ip.org-le-ssl.conf /etc/apache2/sites-available/cantabrana.no-ip.org-le-ssl.conf && \
	ln -s /usr/config/proxy-server/apache-config/sites-enabled/cantabrana.no-ip.org.conf /etc/apache2/sites-available/cantabrana.no-ip.org.conf 
fi

if [ ! -e "/etc/apache2/external/cert.pem" ] || [ ! -e "/etc/apache2/external/key.pem" ]
then
  echo ">> generating self signed cert"
  openssl req -x509 -newkey rsa:4086 \
  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=localhost" \
  -keyout "/etc/apache2/external/key.pem" \
  -out "/etc/apache2/external/cert.pem" \
  -days 3650 -nodes -sha256
fi

echo ">> copy /etc/apache2/external/*.conf files to /etc/apache2/sites-enabled/"
cp /etc/apache2/external/*.conf /etc/apache2/sites-enabled/ 2> /dev/null > /dev/null

# exec CMD
echo ">> exec docker CMD"
echo "$@"
exec "$@"
