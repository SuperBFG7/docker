#!/bin/bash

docker start letsencrypt > /dev/null
docker wait letsencrypt > /dev/null

# verbose, show logs for debugging
if [ ! -z "$1" ]; then
	docker logs --since="1m" letsencrypt
	journalctl -b -u docker --since "1 minute ago"

	echo
	echo "for new certs use:"
	echo "# certbot certonly --keep --webroot -w DOMAIN_WEBROOT -d DOMAIN"
	echo
	echo "for multiple domains use:"
	echo "# certbot certonly --keep --webroot -w DOMAIN1_WEBROOT -d DOMAIN1 -w DOMAIN2_WEBROOT -d DOMAIN2"
	echo
	echo "for DNS challenges use:"
	echo "# certbot certonly --manual --preferred-challenges dns -d DOMAIN"
	echo "and to update the DNS challenge accordingly use"
	echo "# dns_challenge.sh CHALLENGE_NAME CHALLENGE_VALUE"
	echo
	echo "to update an existing certificate with more/less domains use:"
	echo "# certbot certificates"
	echo "then pick the desired certificate (name) and use:"
	echo "# certbot certonly --cert-name CERT_NAME -d DOMAIN1 -d DOMAIN2"
	echo
fi

# reload httpd
systemctl reload httpd

# update TLSA entries
TLSA=`/usr/local/bin/tlsa.update.sh`
eval "$TLSA"
