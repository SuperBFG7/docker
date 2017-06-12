#!/bin/bash

NAME=$1
VALUE=$2

echo "nsupdate -l << _EOUPDATE_ >/dev/null"
echo "ttl 3600"
echo "update del $NAME."
echo "update add $NAME.		IN TXT	$VALUE"
echo "show"
echo "send"
echo "_EOUPDATE_"
