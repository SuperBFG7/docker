#!/bin/bash

SSL_DIR="/etc/httpd/ssl/"

function tlsa {
	URL="$1"
	PORT=$2
	echo "update del _$PORT._tcp.$URL."
	echo "update add _$PORT._tcp.$URL.		IN TLSA	3 0 1 `openssl x509 -in $SSL_DIR/$URL.crt -outform DER | sha256sum | sed -e 's/ .*//'`"
	echo "show"
	echo "send"
}

echo "nsupdate -l << _EOUPDATE_ >/dev/null"
echo "ttl 3600"

# add domains here: tlsa DOMAIN PORT
# example:
tlsa foo.bar 443

echo "_EOUPDATE_"
