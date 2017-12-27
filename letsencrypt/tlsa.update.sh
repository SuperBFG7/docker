#!/bin/bash

SSL_DIR="/etc/httpd/ssl/"

function caa {
	DOMAIN="$1"
	echo "update del $DOMAIN.	CAA"
	echo "update add $DOMAIN.	IN	CAA	0 issue letsencrypt.org"
}

function tlsa {
	DOMAIN="$1"
	PORT=$2
	echo "update del _$PORT._tcp.$DOMAIN."
	echo "update add _$PORT._tcp.$DOMAIN.		IN TLSA	3 0 1 `openssl x509 -in $SSL_DIR/$DOMAIN.crt -outform DER | sha256sum | sed -e 's/ .*//'`"
	echo "show"
	echo "send"
}

echo "nsupdate -l << _EOUPDATE_ >/dev/null"
echo "ttl 3600"

# add domains here
# example:
caa foo.bar
tlsa foo.bar 443

echo "_EOUPDATE_"
