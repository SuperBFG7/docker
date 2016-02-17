#!/bin/bash

if [ "$1" = "flush" ]; then
	ip6tables -t nat -F PREROUTING
else
	sleep 5
	ip6="`docker inspect --format='{{range .NetworkSettings.Networks}}{{.GlobalIPv6Address}}{{end}}' named`"
    ip6tables -t nat -A PREROUTING -p udp --dport 53 -j DNAT --to "$ip6"
fi

