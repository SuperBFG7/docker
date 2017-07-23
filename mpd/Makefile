all: mpd

mpd: build tag

force: force-build tag

build:
	sudo docker build -t superbfg7/mpd .

force-build:
	sudo docker build -t superbfg7/mpd --no-cache .

tag:
	sudo docker tag superbfg7/mpd superbfg7/mpd:`/usr/bin/pacman -Sp --print-format %v mpd | tail -1`

