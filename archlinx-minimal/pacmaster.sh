#!/bin/bash

/usr/bin/pacman --noconfirm $@

if [ "$1" != "-Syu" ]; then
	exit 0
fi

/bin/yes | pacman -Scc
rm -rf /usr/share/doc/ /usr/share/gtk-doc/ /usr/share/info /usr/share/man 
